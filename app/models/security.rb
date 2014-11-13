class Security < ActiveRecord::Base
  belongs_to :customer,:class_name=>"Customer",:foreign_key=>"Customer_id"
  
  private
  
  def self.authenticate(username,password)
    @customer = Security.where(username: username).first
    # logger.debug "**User #{@user.firstname}  *************"
    if @customer.password  == password
    # logger.debug "**User #{@user.lastname}  *************"
    @customer
    else
      nil
    end

  end

end
