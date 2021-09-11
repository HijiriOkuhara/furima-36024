class Product < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_charge_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
