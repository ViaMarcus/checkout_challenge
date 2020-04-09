require './lib/item.rb'

describe Item do
    subject(:a) { described_class.new({name: 'Milk', price: 33})}
    subject(:b) { described_class.new({name: 'Chips', price: 55})}
    it 'will have a name' do
        expect(subject.name).to eq 'Chips'
    end

    it 'will raise an error if it does not have a name' do
        expect{ described_class.new({price: 55}) }.to raise_error 'Item must have a name'
    end

    it 'will raise an error if it does not have a price' do
        expect{ described_class.new({name: 'Chips'}) }.to raise_error 'Item must have a price'
    end

    it 'will raise an error if it has an invalid price' do
        expect{ described_class.new({name: 'Chips', price:-5}) }.to raise_error 'Price must be a positive number'
        expect{ described_class.new({name: 'Chips', price: "asd"}) }.to raise_error 'Price must be a positive number'
    end

    it 'will have a price' do
        expect(subject.price).to eq 55
    end

    it 'will have a unique id' do
        expect(a.id).to_not eq b.id 
    end
end