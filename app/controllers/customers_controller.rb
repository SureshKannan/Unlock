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
    @security = Security.new
    @security.customer = @customer
    @security.username = @customer.email
    @security.password = params["txtPassword"]
    @security.save
    CustomerNotifier.send_signup_email(@customer).deliver
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
