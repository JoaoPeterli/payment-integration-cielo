module Cielo
  #Commercial establishment data
  #
  #affiliation
  #affiliation_key
  class Merchant
    attr_accessor :affiliation,:affiliation_key

    def initialize(affiliation,affiliation_key)
      @affiliation  = affiliation
      @affiliation_key = affiliation_key
    end
  end
end
