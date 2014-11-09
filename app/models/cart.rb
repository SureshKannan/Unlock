class Cart < ActiveRecord::Base
  belongs_to :customer #,:class_name=>"Customer",:foreign_key=>"customer_id"
  has_many :cartlineitems
    
  def express_token=(token)
    write_attribute(:express_token, token)
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payer_id = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end

end
