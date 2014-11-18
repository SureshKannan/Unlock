class CustomerNotifier < ActionMailer::Base
  default from: "support@PhoneUnlockService.com"
  # send a signup email to the customer, pass in the customer object that   contains the customers's email address
  def send_signup_email(customer,security)
    @customer = customer
    @security = security
    mail( :to => @customer.email,
    :subject => 'Thanks for choosing phoneunlockservice.com' )
  end
end
