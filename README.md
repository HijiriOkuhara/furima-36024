# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_furigana  | string  | null: false |
| first_name_furigana | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birthday            | integer | null: false |

### Association

- has_many :products
- has_many :comments
- has_many :credit_cards
- has_many :delivery_areas

## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_image          | text       | null: false                    |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| product_category       | string     | null: false                    |
| product_state          | string     | null: false                    |
| delivery_charge_burden | string     | null: false                    |
| delivery_area          | string     | null: false                    |
| delivery_days          | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :credit_card
- has_one :delivery_areas

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## credit_cards テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_information      | string     | null: false                    |
| expiration_date_month | integer    | null: false                    |
| expiration_date_year  | integer    | null: false                    |
| security_code         | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| product               | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## delivery_areas テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user