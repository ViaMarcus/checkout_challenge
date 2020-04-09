require './lib/item.rb'
require './lib/campaign.rb'
require './lib/checkout.rb'

describe Checkout do
    items = [Item.new({name: 'Red Tie', price: 9.25}),
        Item.new({name: 'Sweater', price: 45.0}),
        Item.new({name: 'Skirt', price: 19.95}),
        Item.new({name: 'Yellow Tie', price: 9.25})]
    let(:a) { campaign.new({type: 0, quantity: 60, price: '90%' })} # total discount example
    let(:b) { campaign.new({type: 1, items: [ items[0], items[3] ], quantity: 2, price: '8.50'})} #2 ties example
    subject(:neither) { described_class.new([]) }
    subject(:just_a) { described_class.new([a]) }
    subject(:just_b) { described_class.new([b]) }
    subject(:both) { described_class.new([a,b]) }
        
    it 'test test' do
        expect(1).to eq 1
    end

    it 'sums up all items sent into it' do
        neither.total = 0
        neither.scan(items[1])
        neither.scan(items[2])
        expect(neither.total).to eq 64.95
    end

    it 'allows checkout discount' do
        just_a.scan(items[2])
        just_a.scan(items[2])
        expect(just_a.total).to eq 81
    end

    it 'allows low price of each when buying several eligable items' do 
        just_b.scan(items[0])
        just_b.scan(items[3])
        expect(just_b.total).to eq 17
    end

    it 'allows several campaigns to function at the same time' do
        both.scan(items[0])
        both.scan(items[0])
        both.scan(items[0])
        both.scan(items[2])
        expect(both.total).to eq 63.45
    end
end