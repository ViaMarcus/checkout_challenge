require_relative './item.rb'
class Campaign
    $TOTAL_DISCOUNT = 0 #discount on CO total (price, quantity = limit)
    $BUY_MANY_DISCOUNT_FOR_EACH = 1 #discount for each item when buying many of a kind, or related items (items, price, quantity)
    $NTH_FOR_LESS = 2 #e.g Buy 3 pay -x% for 3rd item specified items (items, price, quantity)
    $SPECIAL_PRICE = 3 #Special price for one item right now (item, price)
    $SET_PRICE = 4 #Special set price, e.g. 3 for 10 (item, price, quantity)
    $COMBINE_FREELY = 5 #Special set price, but it covers several items (items, price, quantity)
    attr_accessor 

    def initialize(attrs = {})
        @items
        @quantity
        @price
        @type = attrs[:type]
        make_camp_of_type(attrs[:type],attrs[:quantity],attrs[:price],attrs[:items])
    end

    def make_camp_of_type(type, quantity, price, items)
        case type
        when 0
            @price = price
            @quantity = quantity
            @items = []
        when 1..2, 4..5
            @price = price
            @quantity = quantity
            @items = items
        when 3
            @price = price
            @items = items
            @quantity = 1
        else
            raise 'Make a valid campaign type selection (0-5)'
        end
        @type = type
    end

    def calculate_subtotal(attrs = {})
        case @type
        when 0
            0
        when 1
            calc_disc_each(attrs[:items])
        else
            raise 'Not implemented yet'
        end
    end

    def calculate_total(total)
        if total > @quantity 
            parse_percent(total)
        else
           total
        end
    end

    private

    def parse_percent(price)
        price*(@price.to_f / 100)
    end

    def calc_disc_each(items)
        if items.length >= @quantity
            total = items.map { |item| [item.price, @price.to_f].min }.sum #should never be more expensive buying more
        else
            items.map { |item| item.price }.sum
        end
    end
end