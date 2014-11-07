class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    @cart = current_cart
    logger.debug "**User ID #{session[:cart_id]}  *************"     
    @cartitem = Cartlineitem.new(:Cart_id => session[:cart_id],:Product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:Orderstatus_id=>1)
    @cartitem.save
    if params[:cmdContinue] then
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
end
