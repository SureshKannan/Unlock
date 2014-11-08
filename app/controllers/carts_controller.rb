class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @customer = Customer.find(session[:customer_id])
  end
end
