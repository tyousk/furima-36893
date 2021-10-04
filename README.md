# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :buy_records
- has_many :items

## buy_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- |------------------------------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :items
- has_one :addresses

## items テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| image      | string     | null: false                    |
| name       | string     | null: false                    |
| about      | text       | null: false                    |
| category   | string     | null: false                    |
| statues    | string     | null: false                    |
| fee        | string     | null: false                    |
| sender     | string     | null: false                    |
| send_day   | string     | null: false                    |
| price      | string     | null: false                    |
| seller     | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :buy_records
- belongs_to :user

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

- belong_to :items