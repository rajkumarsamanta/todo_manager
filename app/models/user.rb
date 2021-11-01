class User < ApplicationRecord
  validates :first_name, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :email, uniqueness: true

  has_secure_password
  has_many :todos
end
