seller = [	["abc1","12345"],
			["abc2","12345"],
			["abc3","12345"],
			["abc4","12345"],
			["abc5","12345"],
			["abc6","12345"],
			["abc7","12345"],
			["abc8","12345"]]
Seller.delete_all

seller.each do |s|
	seller = Seller.new
	seller.account = s[0]
	seller.password = s[1]
	seller.save
end

items = [	["abc1","AB123",100,"In Stock","100 Street IL"],
			["abc1","AB124",110,"Shipped","200 Street CA"],
			["abc1","AB125",120,"Preparing for Shipment","100 Street IL"],
			["abc1","AB126",125,"Returned in Good Condition","100 Street IL"],
			["abc1","AB127",12,"Returned in Bad Condition","100 Street IL"],
			["abc1","AB128",125,"In Stock","100 Street IL"],
			["abc1","AB129",125,"In Stock","100 Street IL"],
			["abc1","AB130",125,"In Stock","100 Street IL"]]
Item.delete_all
	items.each do |entry|
	item = Item.new
	item.seller = entry[0]
	item.sku = entry[1]
	item.quantity = entry[2]
	item.status = entry[3]
	item.location = entry[4]
	
	item.save
	end

