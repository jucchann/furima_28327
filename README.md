# README

# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_name_kana | string | null: false               |
| first_name_kana  | string | null: false               |
| birthday         | date   | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_many :comments

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_one :purchase
- has_one :delivery_address
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_from
- belongs_to_active_hash :delivery_days

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_ id  | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## delivery_address テーブル

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| post_code     | string  | null: false               |
| prefecture    | string  | null: false               |
| city          | string  | null: false               |
| street_number | string  | null: false               |
| building      | string  |                           |
| phone_number  | string  | null: false               |

### Association
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
