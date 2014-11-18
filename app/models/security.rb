class Security < ActiveRecord::Base
  belongs_to :customer,:class_name=>"Customer",:foreign_key=>"Customer_id"
  
  def self.authenticate(username,password)
    @security = Security.where(username: username,password: password).first
  end

end
