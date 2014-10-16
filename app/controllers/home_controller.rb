class HomeController < ApplicationController
  def index
    
  end
  def account
    @countries = Country.all
    @customer = Customer.new
  end
end
