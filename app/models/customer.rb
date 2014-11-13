class Customer < ActiveRecord::Base
   #validates :email,:FirstName,:LastName, :presence => true
   #validates :email, :uniqueness=> true
   belongs_to :country,:class_name=>"Country",:foreign_key=>"Country_id"
   has_one :security
   private
   
     def self.authenticate(email,password)
    @customer = Customer.where(email: email).first
    # logger.debug "**User #{@user.firstname}  *************"
     if @customer && @custmer.security.password == password
    # logger.debug "**User #{@user.lastname}  *************"
    @customer
    else
      nil
    end


  end
end
