# テーブル設計

## owners テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| account_name       | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| postal_code        | string  | null: false               |
| state_province_id  | integer | null: false               |
| city               | string  | null: false               |
| address_line_1     | string  | null: false               |
| address_line_2     | string  |                           |
| phone_number       | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_one :shop
- has_many :items


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| postal_code        | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :orders


## shops テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false, unique: true      |
| owner  | references | null: false, foreign_key: true |

### Association

- belongs_to :owner
- has_many :items


## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false, limit: 40         |
| info     | text       | null: false, limit: 1500       |
| color_id | integer    | null: false                    |
| price    | integer    | null: false                    |
| owner    | references | null: false, foreign_key: true |
| shop     | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

### Association

- belongs_to :owner
- belongs_to :shop
- belongs_to :category
- has_one :order


## categories テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :items


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| first_name        | string    | null: false                    |
| last_name         | string    | null: false                    |
| postal_code       | string    | null: false                    |
| state_province_id | integer   | null: false                    |
| city              | string    | null: false                    |
| address_line_1    | string    | null: false                    |
| address_line_2    | string    |                                |
| phone_number      | string    | null: false                    |
| order             | reference | null: false, foreign_key: true |

### Association

- belongs_to :order