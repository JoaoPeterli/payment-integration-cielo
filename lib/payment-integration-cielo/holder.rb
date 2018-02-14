module Cielo
  #Class responsible for cardholder data
  #
  #number     => Card number
  #expiration => Expiration date card
  #indicator  => Indication of the type of transaction
  #cvv        => Security code
  class Holder
    attr_accessor :token,:number,:expiration,:indicator,:cvv,:name
  
    CVV_NOT_INFORMED = 0
    CVV_INFORMED = 1
    CVV_UNREADABLE = 2
    CVV_NONEXISTENT = 9
    

   #Initialize the carrier
   def initialize( token_or_number,
                   expiration_year = nil,
                   expiration_month = nil,
                   indicator = nil,
                   cvv = Holder::CVV_NOT_INFORMED )
   
     if expiration_year.nil?
        @token = token_or_number
      else
        @number = token_or_number
        @expiration = "#{expiration_year}#{expiration_month.to_s.rjust(2, '0')}"
        @indicator = indicator
        @cvv = cvv
      end
    end
  end
end
