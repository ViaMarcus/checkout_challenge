require './lib/item.rb'
require './lib/campaign.rb'
describe Campaign do
    items = [Item.new({name: 'Red Tie', price: 9.25}),
            Item.new({name: 'Sweater', price: 45.0}),
            Item.new({name: 'Skirt', price: 19.95}),
            Item.new({name: 'Yellow Tie', price: 9.25})]
    subject(:a) {described_class.new({type: 0, quantity: 60, price: '90%' })} # total discount example
    subject(:b) {described_class.new({type: 1, items: [items[0],items[3]], quantity: 3, price: '8.50'})} #2 ties example

    it 'gives 10% discount for total over 60' do
        expect(a.calculate_total(70)).to eq 63
    end

    it 'does not give a discount when total is too low' do
        expect(a.calculate_total(55)).to eq 55
    end

    it 'gives a discount when buying several of same item' do
        expect(b.calculate_subtotal(items: [items[0],items[0],items[0]])).to eq 25.5
    end

    it 'does not give a discount if number of items are too low to reach discount levels' do
        expect(b.calculate_subtotal(items: [items[0],items[0]])).to eq 18.50
    end

end