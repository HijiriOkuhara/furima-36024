FactoryBot.define do
  factory :purchase_record_delivery_area do
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '横浜市緑区' }
    block { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { 12_345_678_901 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
