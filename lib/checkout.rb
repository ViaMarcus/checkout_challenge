require './lib/item.rb'
require './lib/campaign.rb'

class Checkout
    attr_accessor :total

    def initialize(campaigns)
        @campaigns = campaigns
        @items = []
    end

    def scan(item)
        @items << item
    end

    def total
        left = @items
        total = 0
        @campaigns.each { |camp|
            do_now = []
            do_later = []
            left.each { |item|
                if camp[:items].include?(item)
                    do_now << item
                else
                    do_later << item
                end
            left = do_later
            }
            total += camp.calculate_subtotal(do_now)
        }
        total += left.map {|item| item[:price]}.sum
        total
    end

    def print_receipt
        
    end

    private
    
    def sub_total(campaign, items)
        
    end

end