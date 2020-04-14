require './lib/checkout'
items = [Item.new({name: 'Red Tie', price: 9.25}),
        Item.new({name: 'Sweater', price: 45.0}),
        Item.new({name: 'Skirt', price: 19.95}),
        Item.new({name: 'Yellow Tie', price: 9.25})]
campaigns = [   Campaign.new({type: 0, quantity: 60, price: '90%' }), # total discount example
                Campaign.new({type: 1, items: [ items[0], items[3] ], quantity: 2, price: '8.50'})] #2 ties example
co = Checkout.new(campaigns)

puts "These are our avaiable items: "
items.each {|item| 
    puts "#{item.id} \t #{item.name} \t #{item.price}"
}
puts "Our active campaigns are:"
campaigns.each {|camp| puts camp.to_text}
puts 'To scan an item, please simply write the ID of the item, "undo" to remove last item scanned, or "pay" to proceed to checkout'
while true
    inp = gets.chomp
    if inp == "pay"
        puts "Your total is #{co.total}. Thank you for shopping"
        exit(0)
    elsif inp == "undo"
        if co.items.length > 0
            item = items.pop()
            puts "#{item.name} was removed!"
        else 
            puts "Nothing to remove"
        end
    elsif
        [0,1,2,3].include?(inp.to_i)
        itm = (items.select {|item| item.id == inp.to_i}[0] )
        co.scan(itm)
        puts "#{itm.name} \t #{itm.price}"
    else
        puts "Could not scan that item!"
    end
end

