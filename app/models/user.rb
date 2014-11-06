class User < ActiveRecord::Base
  attr_accessor :password
  has_many :carts
  has_many :items, :through => :carts
  validates_confirmation_of :password
  before_save :encrypt_password

  private
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email,password)
    @user = User.where(email: email).first
    # logger.debug "**User #{@user.firstname}  *************"

    if @user && @user.password_hash == BCrypt::Engine.hash_secret(password, @user.password_salt)
    # logger.debug "**User #{@user.lastname}  *************"
    @user
    else
      nil
    end

  end
end
