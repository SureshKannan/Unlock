class HomeController < ApplicationController
  def index
    @count = 0
  end
  def account
    @countries = Country.all
    @customer = Customer.new
  end
end
