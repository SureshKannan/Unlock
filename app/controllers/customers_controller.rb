class CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @countries = Country.all
    #@imei = params["txtImei"]
  end
  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    
    #create a security entry
    @security = Security.new
    @security.customer = @customer
    @security.username = @customer.email
    @security.password = params["txtPassword"]
    @security.save
    
    #updating the customer id
    @cart = Cart.find(session[:cart_id]);
    @cart.customer_id = @customer
    @cart.save
    
    #send an email alert
    #CustomerNotifier.send_signup_email(@customer).deliver
    
    
    
    render "showcart"
  end
  def showcart
    @cart = Cart.find(session[:cart_id])
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
