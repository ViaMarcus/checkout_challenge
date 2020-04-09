class Checkout
    attr_accessor :total

    def initialize(attr = {})
        @pricelist = attr[:pricelist] || {}
        

    end
    
end