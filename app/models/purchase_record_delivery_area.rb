class PurchaseRecordDeliveryArea
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :block, :building_name, :phone_number, :product_id, :user_id, :token

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: " is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture, numericality: {other_than: 1, message: " can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{11,11}\z/, message: " is too short"}, numericality: {message: " is invalid. Input only number"}
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    DeliveryArea.create(postal_code: postal_code, prefecture_id: prefecture, city: city, block: block, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end