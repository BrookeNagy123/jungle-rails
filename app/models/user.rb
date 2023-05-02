class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :password, presence: true, length: {minimum: 5}

  before_save :update_email 

  def self.authenticate_with_credentials(email, password)
    @email = email.strip
    @email_lowercase = @email.downcase

    @user = User.find_by_email(@email_lowercase)

    if @user.authenticate(password)
      @user
    else
      nil
    end
  end 

  def update_email
    self.email = email.strip
    self.email = self.email.downcase
  end 
end
