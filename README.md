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
- belongs_to _active_hash :birth_year
- belongs_to _active_hash :birth_month
- belongs_to _active_hash :birth_day
- has_many :buyer

## items テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| name         | string  | null: false       |
| image        | text    | null: false       |
| price        | integer | null: false       |
| explanation  | text    | null: false       |
| category_id  | integer | null: false       |
| condition_id | integer | null: false       |
| postage_id   | integer | null: false       |
| sender_id    | integer | null: false       |
| sending_id   | integer | null: false       |
| user_id      | integer | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buyer

## buyers テーブル

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| item_id | integer | foreign_key: true |
| user_id | integer | foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_many :addresses

## addresses テーブル

| Column       | Type    | Options           |
| ------------ | ------- | ----------------- |
| postal_code  | integer | null: false       |
| prefectures  | string  | null: false       |
| city         | string  | null: false       |
| house_number | integer | null: false       |
| building     | integer | null: false       |
| phone_number | integer | null: false       |
| buyer_id     | integer | foreign_key: true |

### Association

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
