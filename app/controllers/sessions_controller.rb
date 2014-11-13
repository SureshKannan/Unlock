class SessionsController < ApplicationController
  def new
    
  end
  def create      
        
    if @customer = Security.authenticate(params[:UserName], params[:Password])
       logger.debug "**User #{@customer.id}  *************"
       session[:user_id] = @customer.id
             
       redirect_to '/carts/show', :notice => "Logged sucessfully"
     else
       flash.now[:alert] = " Wrong email and password combination"
       render :action => 'new'
     end
  end
  def destroy
    
  end
end
