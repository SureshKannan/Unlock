class SenderNotifier < ActionMailer::Base
  default from: "support@PhoneUnlockService.com"
  # send a signup email to the customer, pass in the customer object that   contains the customers's email address
  def send_information(cart,subject,imei)
    @cart = cart
    @imei = imei
    mail( :to => "unlockphn@gmail.com",
    :subject => subject )
  end
  
end