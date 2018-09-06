class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  enum role: ['user', 'admin']
end
