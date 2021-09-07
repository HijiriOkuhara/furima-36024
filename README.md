# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_furigana  | string | null: false               |
| first_name_furigana | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :products
- has_many :purchase_records

## products テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| product_category       | integer    | null: false                    |
| product_state          | integer    | null: false                    |
| delivery_charge_burden | integer    | null: false                    |
| prefectures            | integer    | null: false                    |
| delivery_days          | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| purchase_record        | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :purchase_record

## purchase_records テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |

### Association

- has_one :product
- belongs_to :user
- has_one :delivery_area

## delivery_areas テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | integer    | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record