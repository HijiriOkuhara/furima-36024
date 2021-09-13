class DeliveryChargeBurden < ActiveHash::Base
  self.data = [
    { id: 1, delivery_charge_burden: '---' },
    { id: 2, delivery_charge_burden: '着払い（購入者負担）' },
    { id: 3, delivery_charge_burden: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations
  has_many :products
end
