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
    begin
      
      @customer = Customer.new(customer_params)
      @customer.save
      
      #create a security entry
      @security = Security.new
      @security.customer = @customer
      @security.username = @customer.email
      @security.password = params["txtPassword"]
      @security.save
      
      #updating the customer id
      @cart = Cart.find(session[:cart_id])
      @cart.customer_id = @customer.id
      @cart.save
      
      session[:customer_id] = @customer.id
      
      #send an email alert
      CustomerNotifier.send_signup_email(@customer).deliver
      
      #updating the invoice total
      @totalamount=0
      @cart.cartlineitems.each do |p|
        @totalamount = @totalamount + p.amount
      end
      @cart.salesamount = @totalamount
      @cart.save
      
      
      
    rescue Exception => e
      puts "*************** ERROR ****************"
      puts e.message
      puts "*************** ERROR ****************"
      
    end
    redirect_to carts_show_url
    #render "showcart"
  end
  def showcart
    @cart = Cart.find(session[:cart_id])
  end
  
  def express_checkout
  response = EXPRESS_GATEWAY.setup_purchase(100,
    ip: request.remote_ip,
    return_url: "http://0.0.0.0:3000/home/index",
    cancel_return_url: "http://0.0.0.0:3000/home/index",
    currency: "USD",
    allow_guest_checkout: true,
    items: [{name: "Order", description: "Order description", quantity: "1", amount: 100}]
  )
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
end

  
  private
  def customer_params
    if :customer.nil?
      params.permit(:email,:FirstName,:LastName,:Country_id,:imei)
    else
      params.require(:customer).permit(:email,:FirstName,:LastName,:Country_id,:imei)
    end
  end
end
