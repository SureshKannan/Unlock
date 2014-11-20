class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @cart = current_cart
    @count = @cart.cartlineitems.size
    @product = Product.find(params[:id])
  end
end
