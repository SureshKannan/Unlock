class SessionsController < ApplicationController
  def new
    
  end
  def create
    session[:user_id] = nil
    
    
    if @user = User.authenticate(params[:email], params[:password])
       logger.debug "**User #{@user.id}  *************"
       session[:user_id] = @user.id
       logger.debug "**IMEI  session controller #{session[:imei]}  *************"
       
       redirect_to '/cartlist', :notice => "Logged sucessfully"
     else
       flash.now[:alert] = " Wrong email and password combination"
       render :action => 'new'
     end
  end
  
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = " You logged out sucessfully"
    redirect_to '/'
  end
end
