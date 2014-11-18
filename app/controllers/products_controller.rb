class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    @cart = current_cart
    logger.debug "**User ID #{session[:cart_id]}  *************"     
    @cartitem = Cartlineitem.new(:cart_id=>@cart.id,:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1)
    #@cartitem = @cart.cartlineitems.build(:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1,:comments=>"",:status=>"")
    if @cartitem.save then 
      @cart.cartlineitems << @cartitem
    end
    if params[:cmdContinue] then
        redirect_to action: 'index'
    else
        if session[:customer_id].nil? == false then
          redirect_to carts_show_url
        else
          redirect_to customers_index_url
        end 
       
        #redirect_to  :controller=>"customers",:action=> 'index'
        #@customer = Customer.new
        #@countries = Country.all
        #render "customers/index"
    end    
  end
  def show
    @cart = current_cart
    @count = @cart.cartlineitems.size
    @product = Product.find(params[:id])
  end
end
