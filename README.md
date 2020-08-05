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
- has_many :delivery_address
- has_many :comments

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_image    | text       | null: false                    |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| delivery_from | string     | null: false                    |
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| seller        | references | null: false, foreign_key: true |
| buyer         | references | foreign_key: true              |

### Association
- has_many :comments
- has_one :delivery_address
- belongs_to :user

## delivery_address テーブル

| Column        | Type    | Options                   |
| ------------- | ------- | ------------------------- |
| post_code     | integer | null: false               |
| prefecture    | string  | null: false               |
| city          | string  | null: false               |
| street_number | string  | null: false               |
| building      | string  |                           |
| phone_number  | string  | null: false               |

### Association
- belongs_to :user
- has_one :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
