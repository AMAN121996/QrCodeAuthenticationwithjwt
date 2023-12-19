# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = JWT.encode({ user_id: id }, Rails.application.secrets.secret_key_base)
  end
end
