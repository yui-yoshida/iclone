class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  has_many :pictures
  has_many :favorites, dependent: :destroy
end
