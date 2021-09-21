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

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' },
                      numericality: { message: 'is invalid. Input half-width characters' }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :state_id
      validates :delivery_charge_burden_id
      validates :prefecture_id
      validates :delivery_day_id
    end
  end
end
