class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge_burden
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_burden_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                    numericality: { message: 'is invalid. Input half-width characters' }
end
