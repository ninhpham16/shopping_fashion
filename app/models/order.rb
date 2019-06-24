# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: %i[Pending Ordered Closed Complete]
  belongs_to :user

  has_many :order_items

  validates :address, presence: true, length: { maximum: 150 }
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :full_name, presence: true, length: { maximum: 50 }
end
