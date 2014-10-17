class CustomerNotifier < ActionMailer::Base
  default from: "skannan@fourus.ca"
  # send a signup email to the customer, pass in the customer object that   contains the customers's email address
  def send_signup_email(customer)
    @customer = customer
    mail( :to => @customer.email,
    :subject => 'Thanks for signing up' )
  end
end
