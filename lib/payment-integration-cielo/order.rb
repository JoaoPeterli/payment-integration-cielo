module Cielo
  class Order
    #Property data
    #
    # number          => Number of the application store
    # total           => Amount
    # codigo          => ISO code currency
    # date_time       => Date and time of request
    # description     => Description of the application
    # language        => Portuguese language PT
    # shipping        => Cost of freight
    # soft_descriptor => Name of the customer invoice showing
    attr_accessor :number,:total,:currency,:date_time,:description,:language,:shipping,:soft_descriptor

    def initialize(number=0,total=0,currency=986,date_time=nil)

      if(date_time == nil)
        now = Time.now
        date_time = now.strftime("%Y-%m-%dT%H:%M:%S")
      end

      @number    = number
      @total     = total
      @currency  = currency
      @language  = "PT"
      @date_time = date_time
      @shipping  = 0
      @description =""
   end
  end
end
