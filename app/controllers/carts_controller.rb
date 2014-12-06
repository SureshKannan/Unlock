class CartsController < ApplicationController
  def create
    @cart = current_cart
    logger.debug "****cart id #{@cart.id} **********"
    logger.debug "**User ID #{session[:cart_id]}  *************"     
    @cartitem = Cartlineitem.new(:cart_id=>@cart.id,:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1)
    #@cartitem = @cart.cartlineitems.build(:product_id=>params[:product_id], :imei => params[:txtImei],:quantity=>1, :price => params[:price], :amount=> params[:price],:orderstatus_id=>1,:comments=>"",:status=>"")
    if @cartitem.save then 
      @cart.cartlineitems << @cartitem
    end
    # if params[:cmdContinue] then
        # redirect_to action: 'index'
    # else
        # if session[:customer_id].nil? == false then
          # @cart.customer_id = session[:customer_id]
          # @cart.save
# 
          # #updating the invoice total
          # @totalamount=0
          # @cart.cartlineitems.each do |p|
            # @totalamount = @totalamount + p.amount
          # end
          # @cart.salesamount = @totalamount
          # @cart.save
#                 
          # redirect_to carts_show_url
        # else
          # redirect_to customers_index_url
        # end 
    # end    
  end
  
  def show
    @cart = Cart.find(session[:cart_id])
    @customer = Customer.find(session[:customer_id])
  end
  def checkout
    
  end
  def express
    @cart = Cart.find(session[:cart_id])
    amount = @cart.salesamount*100
    @amount = amount
    response = EXPRESS_GATEWAY.setup_purchase(amount,
       :ip                => request.remote_ip,
       :currency          => "CAD",
       :return_url        => carts_confirm_url,
       :cancel_return_url => home_index_url
    )
     logger.debug "*********************************"
     logger.debug response
     logger.debug "*********************************"
     @response = response
     @token = response.token
  
     session[:token]=@token
     redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  def confirm
    @cart = Cart.find(session[:cart_id])
    @customer = Customer.find(session[:customer_id])

    det = EXPRESS_GATEWAY.details_for(session[:token])
    @payerid = det.payer_id
    session[:payerid]=@payerid
    
    @cart.paypaltoken = session[:token]
    @cart.paypalid = @payerid
    @cart.receiptamount = @cart.salesamount
    @cart.save
    
    @firstname = det.params["first_name"]
    @lastname = det.params["last_name"]
  end
  def purchase
    amount = current_cart.salesamount*100
    response = EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
    if response.success?
      @cart = Cart.find(session[:cart_id])
      @customer = Customer.find(session[:customer_id])
      session[:cart_id] = nil
      #send payment confirmation email
      CustomerNotifier.send_payment_confirmation_email(@cart,@customer).deliver
    end

  end
  def express_purchase_options
  {
    :ip => request.remote_ip,
    :token => session[:token],
    :payer_id => session[:payerid]
  }
  end
end
