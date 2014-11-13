class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    @cart = current_cart
    
    logger.debug "**User ID #{session[:cart_id]}  *************"     
    
    
    @cartitem = Cartlineitem.new(:cart_id=>@cart.id,:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1)
    #@cartitem = @cart.cartlineitems.build(:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1,:comments=>"",:status=>"")
     # if @cartitem.save then 
       # @cart.cartlineitems << @cartitem
     # end
    if params[:cmdContinue] then
      logger.debug "**Cart ID #{session[:cart_id]}  *************" 
      logger.debug "**Items #{@cart.cartlineitems.count}  *************"     
        redirect_to action: 'index'
    else
        redirect_to customers_index_url 
        #redirect_to  :controller=>"customers",:action=> 'index'
        #@customer = Customer.new
        #@countries = Country.all
        #render "customers/index"
    end    
  end
  def show
    @product = Product.find(params[:id])
  end
  
  def addCart
    @cartitem = Cartlineitem.new(:cart_id=>@cart.id,:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1)
     if @cartitem.save then 
       # total += @cartitem.price.to_f
      # session[:total] = total
       logger.debug "**products con total #{session[:total]}  *************" 
    end
  end
end
