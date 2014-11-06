class ProductsController < ApplicationController
  before_action :get_params
  def index
    @products = Product.all
  end
  def create
   @cart = current_cart
    logger.debug "**User ID #{session[:cart_id]}  *************" 
    
    
   @item = Item.new(:cart_id => session[:cart_id], :imei => params[:txtImei], :price => 0.00, :status => 'ordr created', :paystatus => '' )
  @item.save
    if params[:cmdContinue] then
      redirect_to action: 'index'
    else
      redirect_to  action: 'user'
    end    
  end
  def show
    @product = Product.find(params[:id])
  end
  def user
        
    # if current_user
      # logger.debug "**User firstname #{current_user.firstname}  *************" 
      # redirect_to :payment
    # end
    @user = User.new  

  end
  
  def cartlist
    
    logger.debug "***** products controller cartlist &&&&&&&&&"
  end
  private
  def get_params
    params.permit(:cmdContinue, :cmdPayNow, :txtImei) 
  end
  
end
