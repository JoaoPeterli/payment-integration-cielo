require "spec_helper"
require "cred_card_cielo"

describe "#Initialize " do
  before :each do
                @obj = CredCardCielo::CredCardCieloIe.new('123123123','654645456666665454')
              end

  it "sets the initialize  CredCardCielo and merhant" do
     expect(@obj).to be
  end

  it "sets the initialize  holder" do
     holder = @obj.holder(1231, expiration_year = nil,expiration_month = nil,indicator = nil,cvv = 3)
     expect(holder).to be
  end

  it "sets the set name older" do
    order = @obj.order("213434", 10000)
    expect(order).to be
  end

  it "sets the set name payment_method" do
    payment_method = @obj.payment_method("visa",1)
    expect(payment_method).to be
  end

  it "sets the set name transaction" do
     holder = @obj.holder(1231, expiration_year = nil,expiration_month = nil,indicator = nil,cvv = 3)
     order = @obj.order("213434", 10000)
     payment_method = @obj.payment_method("visa",1)
     transaction = @obj.transaction(holder,order,payment_method,"http://localhost/cielo.php",'2',capture: false)
     expect(transaction).to be
  end


  it "sets initialize transaction_request" do
    holder = @obj.holder(1231, expiration_year = nil,expiration_month = nil,indicator = nil,cvv = 3)
    order = @obj.order("213434", 10000)
    payment_method = @obj.payment_method("visa",1)
    transaction = @obj.transaction(holder,order,payment_method,"http://localhost/cielo.php",'2',capture: false)
    transaction_request  = @obj.transaction_request(transaction)
    expect(transaction_request).to be
  end
end
