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
    puts item
}
puts "Our active campaigns are:"
campaigns.each {|camp| puts camp.to_text}
puts 'To scan an item, please simply write the ID of the item, "undo" to remove last item scanned, or "pay" to proceed to checkout'
while true
    inp = gets.chomp
    if inp == 