class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :full_name, length: { maximum: 255}
  validates :phone_number, presence: true, length: { minimum: 10}
  validates :address, presence: true, length: {maximum: 50}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
