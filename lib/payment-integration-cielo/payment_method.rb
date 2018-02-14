module Cielo
  #Class responsible for payment terms
  # parameters
  # issuer       => Bank card issuer
  # product      => Cielo product to be used
  # installment  => Number of installments

  class PaymentMethod

      # Card Visa
      VISA = "visa"

      # Card Mastercard
      MASTERCARD = "mastercard"

      # Card Diners
      DINERS = "diners"

      # Card Discover
      DISCOVER = "discover"

      # Card ELO
      ELO = "elo"

      # Card Amex
      AMEX = "amex"

      # Card JCB
      JCB = "jcb"

      # Card Aura
      AURA = "aura"

      # Payment with cash credit card 
      CREDITO_A_VISTA = 1

      # Payment by credit card in installments by the store
      PARCELADO_LOJA = 2

      # Payment with credit card in installments by the administrator
      
      PARCELADO_ADM = 3

      # Debit card payment 
      DEBITO = "A"


    #Access the variables
    attr_accessor :issuer, :product, :installment

    def initialize(issuer,product = CieloIe::PaymentMethod::CREDITO_A_VISTA, installment=1)
       @issuer = issuer
       @product = product
       @installment = installment
    end
  end
end
