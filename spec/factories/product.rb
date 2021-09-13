FactoryBot.define do
  factory :product do
    name { 'name' }
    description { 'description' }
    category_id { 2 }
    state_id { 2 }
    delivery_charge_burden_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 500 }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
