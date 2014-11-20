class CustomerNotifier < ActionMailer::Base
  default from: "support@PhoneUnlockService.com"
  # send a signup email to the customer, pass in the customer object that   contains the customers's email address
  def send_signup_email(customer,security)
    @customer = customer
    @security = security
    mail( :to => @customer.email,
    :subject => 'Thanks for choosing phoneunlockservice.com' )
  end
  def send_payment_confirmation_email(cart,customer)
    @cart = cart
    @customer = customer
    mail( :to => @customer.email, :bcc=> "unlockphn@gmail.com",
    :subject => 'Thanks for choosing phoneunlockservice.com' )      
  end
end
