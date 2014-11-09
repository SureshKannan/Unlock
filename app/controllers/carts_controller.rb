class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
    @customer = Customer.find(session[:customer_id])
  end
  def checkout
    
  end
  def express
    amount = current_cart.salesamount*100
    response = EXPRESS_GATEWAY.setup_purchase(amount,
      :ip                => request.remote_ip,
      :return_url        => carts_confirm_url,
      :cancel_return_url => home_index_url
    )
    @token = response.token
    session[:token]=@token
    
   
    # EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
#     
    # # def express_token=(token)
    # # write_attribute(:express_token, token)
    # # if new_record? && !token.blank?
      # # 
      # # self.express_payer_id = details.payer_id
      # # self.first_name = details.params["first_name"]
      # # self.last_name = details.params["last_name"]
    # # end
  # # end
#   
#   
    # @url = EXPRESS_GATEWAY.redirect_url_for(response.token)
    # #EXPRESS_GATEWAY.purchase()
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end
  def confirm
    
    details = EXPRESS_GATEWAY.details_for(session[:token])
    @payerid = details.payer_id
    session[:payerid]=@payerid
    @firstname = details.params["first_name"]
    @lastname = details.params["last_name"]
  end
  def purchase
     amount = current_cart.salesamount*100
    response = EXPRESS_GATEWAY.purchase(amount, express_purchase_options)
  end
  def express_purchase_options
  {
    :ip => request.remote_ip,
    :token => session[:token],
    :payer_id => session[:payerid]
  }
  end
end
