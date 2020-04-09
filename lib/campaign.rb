class Campaign.rb
    $TOTAL_DISCOUNT = 0 #discount on CO total
    $SEVERAL_FOR_LESS = 1 #discount when buying many of a kind, or related items
    $SEVERAL_FOR_FEW = 2 #e.g Buy 3 pay for 2 specified items
    $SPECIAL_PRICE = 3 #Special price for one item right now
    
    attr_accessor 

    def initialize(attrs = {})
        @type = get_camp_type(attrs[:type])
        @items = attrs[:items.id] || []
        @quantity = attrs[:quantity]
    end
end

get_camp_type(type)
    