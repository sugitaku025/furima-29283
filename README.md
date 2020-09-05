# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| name     | string | null: false |
| birthday | date   | null: false |

### Association

- has_many :items

## items テーブル

| Column         | Type    | Options           |
| -------------- | ------- | ----------------- |
| item_name      | string  | null: false       |
| image          | text    | null: false       |
| price          | integer | null: false       |
| explanation    | text    | null: false       |
| category       | string  | null: false       |
| item_condition | string  | null: false       |
| postage        | integer | null: false       |
| sender         | string  | null: false       |
| sending        | date    | null: false       |
| user_id        | integer | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column   | Type    | Options           |
| -------- | ------- | ----------------- |
| items_id | integer | foreign_key: true |

### Association

- belongs_to :item
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
