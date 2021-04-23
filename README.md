# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| profile  | text   | null: false |
| occupatin| text   | null: false |
| position | text   | null: false |

### Association

- has_many :comments
- has_many :prototypes

## comments テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | null: false |
| user     | references |             |
| prototype| references |             |

### Association

- belongs_to :user
- belongs_to :prototypes

## prototypes テーブル

| Column    | Type               | Options     |
| --------- | ------------------ | ----------- |
| title     | text               | null: false |
| catch_copy| references         | null: false |
| concept   | references         | null: false |
| image     | ActiveStorageで実装 |             |
| user      | references         |             |

### Association

- belongs_to :user
- has_many   :comments