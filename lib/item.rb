class Item
    attr_accessor :name, :price, :id
    @@next_id = 0
    def initialize(attrs = {})
        @id = @@next_id
        @@next_id += 1
        @name =   setName(attrs[:name])
        @price =  setPrice(attrs[:price])
        puts @id
    end

    private 

    def setName(name)
        name.nil? ? (raise 'Item must have a name') : @name=name
    end
    
    def setPrice(price)
        if !price.nil? && price.to_f > 0
            @price = price.to_f
        end
        @price = price.nil? ? (raise 'Item must have a price') : 
        price.to_f > 0 ? price.to_f : (raise 'Price must be a positive number')
    end

end

