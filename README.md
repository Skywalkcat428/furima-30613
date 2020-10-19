# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :purchases
- has_many :items

## items テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| image           | text       | null: false                     |
| item_name       | string     | null: false                     |
| detail          | text       | null: false                     |
| category        | string     | null: false                     |
| condition       | string     | null: false                     |
| delivery_charge | integer    | null: false                     |
| prefecture      | string     | null: false                     |
| delivery_date   | string     | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false,  foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |
| adress   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :adress

# addresses テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| post_code     | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| house_number  | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |

### Association

- has_one :purchase