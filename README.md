Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cred_card_cielo`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## **Installation**

Add this line to your application's Gemfile:

```ruby
gem 'payment-integration-cielo'
```

And then execute:

 ``` 
  $ bundle install
 ``` 

## **install**

``` 
    $ gem install payment-integration-cielo
 ```

## Required 
  All as transactions necessarily needed from the rods of id the key and the end point

## **Create Transaction**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)

holder = cielo.holder("4012001037141112", 2018, 5, Cielo::Holder::CVV_INFORMED, 123)

holder.name = "Fulano Portador da Silva"

order = cielo.order("213434", 100)

payment_method = cielo.payment_method('visa',Cielo::PaymentMethod::CREDITO_A_VISTA)

transaction=cielo.transaction(holder,order,payment_method,'http://www.google.com.br',Cielo::Transaction::AUTHORIZE_WITHOUT_AUTHENTICATION,capture: false)

resul = cielo.transaction_request(transaction,total=100)
```


## **Capturing a transaction - All**
```
require 'payment-integration-cielo'
 
cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)

transaction.tid = "100699306908642E1001"

transaction = cielo.capture_request(transaction)
```


## **Capturing a transaction - Partial**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment) 

transaction.tid = "100699306908642E1001"

transaction = cielo.capture_request(transaction, 5000)
```


## **Creating a transaction with automatic capture**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)  

holder = cielo.holder("4012001037141112", 2018, 5, Cielo::Holder::CVV_INFORMED, 123)

holder.name = "Fulano Portador da Silva"

order = cielo.order("213434", 100)

payment_method = cielo.payment_method('visa',Cielo::PaymentMethod::CREDITO_A_VISTA)

transaction=cielo.transaction(holder,order,payment_method,'http://www.google.com.br',Cielo::Transaction::AUTHORIZE_WITHOUT_AUTHENTICATION,capture:true)

resul = cielo.transaction_request(transaction,total=100)

transaction.tid = "100699306908642E1001"

transaction = cielo.capture_request(transaction)

```

## **Creating a Token**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)   

holder = cielo.holder("4012001037141112", 2018, 5, Cielo::Holder::CVV_INFORMED, 123)

holder.name = "Fulano Portador da Silva"

token = cielo.token_request(holder)
```


## **Transaction with Token**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)    

holder = cielo.holder("Q6zDYxwrvJuqpeJMdpEfdTb8b++F++h3N1VGfZU3nVw=")

transaction=cielo.transaction(holder,order,payment_method,'http://www.google.com.br',Cielo::Transaction::AUTHORIZE_WITHOUT_AUTHENTICATION)

```


## **Canceling a transaction - Total**
```
require 'payment-integration-cielocred_card_cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)     

transaction.tid = "100699306908642E1001"

transaction = cielo.cacellation_request(transaction)
```


## **Canceling a transaction - Partial**
```
require 'payment-integration-cielo'

cielo = PaymentIntegrationCielo::CieloCardPayment.new(merchant_id, merchant_key, environment)     

transaction.tid = "100699306908642E1001"

transaction = cielo.cacellation_request(transaction,5000)
```

## **Development**

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## **Contributing**

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cred_card_cielo.
