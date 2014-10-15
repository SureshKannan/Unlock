class CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @countries = Country.all
  end
  def new
    @customer = Customer.new
  end
  def create
    
  end
  private
  def customer_params
    if :customer.nil?
      params.permit(:id,:email,:firstname,:lastname,:country_id,:imei,:mode)
    else
      params.require(:customer).permit(:id,:email,:firstname,:lastname,:country_id,:imei,:mode)
    end
  end
end
