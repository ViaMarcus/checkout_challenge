class Item
    attr_accessor :name, :price, :id
    @@next_id = 0
    def initialize(attrs = {})
        @id = @@next_id
        @@next_id += 1
        @name = attrs[:name] # setName(attrs[:name])
        @price = attrs[:price] #setPrice(attrs[:price])
        #puts @id
    end

    # private 

    # def setName(name)
    #     @name = name.nil? ? raise 'An item name is needed' : name
    # end
    
    # def setPrice(price)
    #     if !price.nil? && price.to_f > 0
    #         @price = price.to_f
    #     end
    #     # @price = price.nil? ? raise 'An item price is needed' : 
    #     # price.to_f > 0 ? price.to_f : raise 'Price must be a positive number'
    # end

end

