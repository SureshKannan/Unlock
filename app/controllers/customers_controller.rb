class CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @countries = Country.all
    @imei = params["txtImei"]
  end
  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(customer_params)
    @customer.save
  end
  private
  def customer_params
    if :customer.nil?
      params.permit(:id,:email,:FirstName,:LastName,:Country_id,:imei)
    else
      params.require(:customer).permit(:id,:email,:FirstName,:LastName,:Country_id,:imei)
    end
  end
end
