class ItemsController < ApplicationController

  def new
   
  end

  def show
      puts params["apiKey"]
      puts params["sku"]
      user = User.find_by(APIkey: params["apiKey"])
  	  if user != nil
      	 seller = user.seller
      	 render json: Item.where(seller: seller, sku: params["sku"])
      else
      	 render json: "no data found"
  	  end
  end

  def index
  	  user = User.find_by(APIkey: params["apiKey"])
      if user != nil
      	 seller = user.seller
         
      	 render json: Item.where(seller: seller)
      else
      	 render json: "no data found"
  	  end
  end

  def add
      q = params["quantity"].to_i
      seller = User.find_by(APIkey: params["apiKey"]).seller
      item = Item.find_by(sku: params["sku"], status: "In Stock")
      if item != nil 
        item.quantity = item.quantity + q
        item.save
      else
           u = Item.new
           u.sku = params["sku"]
           u.seller = seller
           u.quantity = q
           u.status = "In Stock"
           u.location = "100 Street IL"
           u.save
      end
      render json: "success"
  end


  def ship
      q = params["quantity"].to_i
      
      seller = User.find_by(APIkey: params["apiKey"]).seller
      
      item = Item.find_by(sku: params["sku"], status: "In Stock",seller: seller)
  
      if item != nil and item.quantity > q
        item.quantity = item.quantity - q
        item.save
        u = Item.find_by(sku: params["sku"], status: "Preparing for Shipment")
        if u == nil
           u = Item.new
           u.sku = item.sku
           u.seller = item.seller
           u.quantity = q
           u.status = "Preparing for Shipment"
           u.location = item.location
           u.save
        else
           u.quantity = u.quantity + q
           u.save
        end
        render json: item
      else
        render json: "no enough item left"
      end
  end

 
end
