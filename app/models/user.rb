class User < ActiveRecord::Base
  has_secure_password
  validates_confirmation_of :password

  enum role: %w(default admin)
end
