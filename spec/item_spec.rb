require './lib/item.rb'

describe Item do
    subject(:a) { described_class.new({name: 'Milk', price: 33})}
    subject(:b) { described_class.new({name: 'Chips', price: 55})}
    it 'will have a name' do
        expect(subject.name).to eq 'Chips'
    end

    it 'will have a price' do
        expect(subject.price).to eq 55
    end

    it 'will have a unique id' do
        expect(a.id).to_not eq b.id 
    end
end