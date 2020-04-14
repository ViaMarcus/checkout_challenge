## The Checkout Challenge
### The Project
This project aims to create a simple model of a checkout system.
The original scope was aiming to sum items in a basket and output a total price for all the items, taking into consideration special campaign rules.
The end product instead contains a very flexible model with several different kinds of discounts, that can all be set using special campaign types and parameters.
In all 3 classes are used, Item, Campaign and Checkout. Included is also an interactive SIM to play around with the code.

### Authors
Marcus https://github.com/ViaMarcus

### Dependencies
The gem RSpec is used, it is included in Gemfile.

### Terminal instructions
To play the SIM:
```
$ruby co_init.rb
```
To explore the model, use IRB:

To create an Item:
```
>itm = Item.new({name: name, price: 3.23})
```
a unique itm.id will be automatically assigned on creation.

To create a new campaign, you need to choose a type.  
To create a checkout discount of 10 % when purchase is above 75.
```
>Campaign.new({type: 0, price: "90%", quantity:75})
```
To create a campaign that discounts each specified item to a new price(6.25) when you buy at least a quantity (3 below).
```
>Campaign.new({type: 1, items: [itm1, itm2], quantity: 3, price: 6.25)
```
Then you can combine all that you have.
```
>co = Checkout.new([campaign1, campaign2])
#adding items
>Checkout.items = [itm1,itm2..itmn]
```
Then use checkouts function
```
>co.scan(item) #adds an item
>co.total #returns the calculated sum
```
### License
This project is licensed under an MIT License.