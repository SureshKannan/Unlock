class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    if params[:cmdContinue] then
      redirect_to action: 'index'
    end    
  end
  def show
    @product = Product.find(params[:id])
  end
end
