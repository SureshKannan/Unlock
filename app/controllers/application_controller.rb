class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    private
  def current_user    
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
   # logger.debug "**@current User #{@current_user.firstname}  *************"
  end 
  
  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id  
    logger.debug "&&&& Cart ID #{session[:cart_id]}"
  end

end
