class CartsController < ApplicationController
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

    details = EXPRESS_GATEWAY.details_for(session[:token])
    @payerid = details.payer_id
    session[:payerid]=@payerid
    @firstname = details.params["first_name"]
    @lastname = details.params["last_name"]
  end
  def purchase
    amount = current_cart.salesamount*100
    response = EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
    session[:cart_id] = nil
  end
  def express_purchase_options
  {
    :ip => request.remote_ip,
    :token => session[:token],
    :payer_id => session[:payerid]
  }
  end
end
