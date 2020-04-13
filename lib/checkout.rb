require './lib/item.rb'
require './lib/campaign.rb'

class Checkout
    attr_accessor :items

    def initialize(campaigns)
        @campaigns = campaigns
        @items = []
    end

    def scan(item)
        @items << item
    end

    def total
        left = @items
        toto = 0
        @campaigns.each { |camp|
            do_now = left.select {|item| camp.items.include?(item)}
            puts do_now
            left.delete_if {|item| camp.items.include?(item)}
            puts left
            toto += camp.calculate_subtotal({items: do_now})
            puts toto
        }
        toto += left.map {|item| item.price}.sum
        co_camp = @campaigns.detect { |camp| camp.type == 0} || Campaign.new(type: 0, quantity: 0, price: "100%" )
        co_camp.calculate_total(toto)
    end

    def print_receipt
        
    end

    private
    
    def sub_total(campaign, items)
        
    end

end