module Cielo
  class Transaction
    # Only authenticate the transaction
    ONLY_AUTHENTICATE = 0

    # You authorize the transaction only if it has been authenticated
    AUTHORIZE_IF_AUTHENTICATED = 1

    # Authorizes the transaction
    AUTHORIZE = 2

    # Direct authorization, without authentication
    AUTHORIZE_WITHOUT_AUTHENTICATION = 3

    # Authorization for recurrence
    RECURRENCE = 4

    attr_accessor :tid,
                  :pan,
                  :status,
                  :authentication_url,
                  :authentication,
                  :authorization,
                  :merchant,
                  :holder,
                  :order,
                  :payment_method,
                  :return_url,
                  :authorize,
                  :do_capture,
                  :capture,
                  :free_field,
                  :bin,
                  :generate_token,
                  :avs,
                  :token,
                  :cancellation

    def initialize(
      merchant,
      holder,
      order,
      payment_method,
      return_url,
      authorize,
      capture: true)

      @merchant = merchant
      @holder = holder
      @order = order
      @payment_method = payment_method
      @return_url = return_url
      @authorize = authorize
      @do_capture = capture
    end
  end
end
