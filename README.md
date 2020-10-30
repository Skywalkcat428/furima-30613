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

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| detail             | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| delivery_charge_id | integer    | null: false                     |
| prefecture_id      | integer    | null: false                     |
| delivery_date_id   | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false,  foreign_key: true |

### Association

- belongs_to       :user
- has_many         :comments
- has_one          :purchase
- has_one_attached :image

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype

## purchasers テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

# addresses テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| post_code     | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| house_number  | string     | null: false                     |
| building_name | string     |                                 |
| phone_number  | string     | null: false                     |
| purchase      | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchaser