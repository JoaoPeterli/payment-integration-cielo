require "payment-integration-cielo/version"
require "payment-integration-cielo/merchant"
require "payment-integration-cielo/holder"
require "payment-integration-cielo/order"
require "payment-integration-cielo/payment_method"
require "payment-integration-cielo/transaction"
require "payment-integration-cielo/transaction_request"
require "payment-integration-cielo/cancellation_request"
require "payment-integration-cielo/capture_request"
require "payment-integration-cielo/token_request"
require "payment-integration-cielo/authorization_request"
require "net/http"


module PaymentIntegrationCielo 
  def self.root_path
    File.dirname _dir_
  end

  # order             =>  Responsible for instantiatin the order data
  # holder            =>  Responsible for instantiation of cardholder data
  # method_payment    =>  Responsible for instantiation of payment method
  # merchant          =>  Responsible for instantiation of the data property


  class CieloCardPayment

     attr_accessor :merchant, :endpoint

     private :merchant, :endpoint

     #Product enviroment
     PRODUCTION ="https://ecommerce.cielo.com.br/servicos/ecommwsec.do"

     #Test enviroment
     TEST = "https://qaseCommerce.cielo.com.br/servicos/ecommwsec.do"

     # request XML namespace and response
     NAMESPACE = "http://ecommerce.cbmp.com.br"

     XML_VERSION = "1.3.0"

    def initialize(affiliation,affiliation_key, endpoint=CieloCardPayment::TEST)
      @merchant = Cielo::Merchant.new(affiliation,affiliation_key)
      @affiliation = affiliation
      @affiliation_key = affiliation_key
      @endpoint = endpoint
   end


   #Returns an instance of the ported
   #
   #token_or_number   =>  Custumer card number
   #expiration_year   =>  Year expiration
   #expiration_month  =>  Month expiration
   #indicator         =>  Security code
   #cvv               =>  Security code
    def holder(token_or_number, expiration_year = nil,expiration_month = nil,indicator = nil,cvv = Holder::CVV_NOT_INFORMED)
       if expiration_year == nil
         return Cielo::Holder.new(token_or_number)
       end

      return Cielo::Holder.new(token_or_number,expiration_year,expiration_month,indicator,cvv)
    end


   #Returns an instance of the application
   #
   #number      => request number
   #total       => amount
   #currency    => currency representation code
   #date_time   => date and time of request
   def order(number,total,currency=986,date_time=nil)
     return  Cielo::Order.new(number,total,currency,date_time)
   end


   # Returns an instance of the payment method
   #
   # issuer      => Emitting  Bank
   # product     => Type product Cielo
   # installment => Plot number
   def payment_method(issuer,product =Cielo::PaymentMethod::CREDITO_A_VISTA,installment=1)
     return Cielo::PaymentMethod.new(issuer,product,installment)
   end


   #Create a transaction instantiates
   #
   #ported                     => Card cardholder data
   #order  pedido              => Order data
   #authorize                  => form of payment
   #capture                    => Capture
   #Return a transaction instance already configured with the data
   def transaction(holder,order,payment_method,return_url,authorize,capture: true)
      return Cielo::Transaction.new(@merchant, holder, order, payment_method, return_url, authorize, capture:capture)
   end


  # Send a request-authorization-tid for Cielo
  def authorization_request(tid)
    authorization_request = Cielo::AuthorizationRequest.new
    response = send_request(authorization_request.serialize(tid,@affiliation, @affiliation_key))
  end


  # Send a request-clearing for Cielo
  def transaction_request(transaction,total=nil)
    transaction_request = Cielo::TransactionRequest.new
    resul = send_request(transaction_request.serialize(transaction))
  end


  # Send a query-catching for Cielo
  def cancellation_request(tid)
    cancellation_request = Cielo::CancellationRequest.new
    resul = send_request(cancellation_request.serialize(tid,@affiliation, @affiliation_key))
  end


  # Send a query-token for Cielo
  def capture_request(tid, total = nil)
     capture_request = Cielo::CaptureRequest.new
     response = send_request(capture_request.serialize(tid, total = nil, @affiliation, @affiliation_key))
  end


  def token_request(holder)
    token_request = Cielo::TokenRequest.new
    response = send_request(token_request.serialize(@merchant, holder,@affiliation, @affiliation_key))
  end


private

   def send_request(message)

      uri = URI(@endpoint)
      response = Net::HTTP.post_form(uri, {"mensagem" => message})
      return response.body
   end
  end
 end
