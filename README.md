# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| furigana_last_name  | string | null: false |
| furigana_first_name | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| name         | string  | null: false       |
| price        | integer | null: false       |
| explanation  | text    | null: false       |
| category_id  | integer | null: false       |
| condition_id | integer | null: false       |
| postage_id   | integer | null: false       |
| sender_id    | integer | null: false       |
| sending_id   | integer | null: false       |
| user_id      | integer | foreign_key: true |

### Association
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :sender
- belongs_to_active_hash :sending
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| item_id | integer | foreign_key: true |
| user_id | integer | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options           |
| ------------- | ------- | ----------------- |
| postal_code   | string  | null: false       |
| prefecture_id | integer | null: false       |
| city          | string  | null: false       |
| house_number  | string  | null: false       |
| building      | string  |                   |
| phone_number  | string  | null: false       |
| buyer_id      | integer | foreign_key: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :buyer

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
