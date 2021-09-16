class PurchaseRecord < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :delivery_area
end
