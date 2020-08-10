
![スクリーンショット 2020-08-05 16 37 15](https://user-images.githubusercontent.com/52862370/89409621-510da300-d75d-11ea-8ea3-be4cc2a51cd6.png)
# デモ
- http://web-share.work/lp/top

# 機能
- User登録
  - メール認証
- 出品機能
  - 料金設定
  - 商品説明
  - カテゴリー選択
- 検索機能
- 決済機能
  - 購入履歴機能
- 取引メッセージ(実装予定）
- YouTube認証（実装予定）


# 動作環境
- DB : MySQL:5.6.47
- Ruby : 2.5.1
- Rails : 5.2.4
- Nginx : 1.15.8
- docker-compose : version 3
- AWS : EC2, RDS, IAM, Route53, ELB( AWS無料枠の上限に達したため、現在ELBは停止中）


## インストール手順
1. git hub よりダウンロード

2. Dockerをbuildする

```
$ docker-compose build
```

3. DBの作成

```
$ docker-compose run app rake db:create
```

4. migrateの実行

```
$ docker-compose run app rake db:migrate
```

5. seedからDB情報を作成

```
$ docker-compose run app rake db:seed
```

6. コンテナの起動

```
$ docker-compose up
```

7. localhostにアクセスすると、閲覧が可能



# テーブル

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|unique: true, null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_number|string|unique: true, null: false|
|password|string|null: false|
|postalcode|integer||
|prefecture_id|integer||
|city_name|string||
|address_number|st  ring||
|building_name|string||
|gender|string||
|avatar|string||
|profile|text||
|performance|text||

<!-- gender以下のカラムはプロフィールページを細かく作るなら必要 -->
<!-- address_phone_numberは本人の住所情報には必要ない -->

### Association
- has_many :sns
- has_many :websites
- has_many :products
- has_many :bought_products, class_name: "product", foreign_key: "client_id"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "product"
- has_many :comments
- has_many :trade_messages
- has_many :evaluations
- has_many :evaluated_users, foreign_key: "evaluated_id", class_name: "Evaluation"
- has_many :likes
- has_many :liked_products, through: :likes, source: :product
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships
- has_many :creditcards
- has_many :sns_credentials, dependent: :destroy
- has_many :receipts
- belongs_to_active_hash :prefecture

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|kind|string|null: false|
|url|string|-------|
|follower|integer|-------|

## Association
has_many :products
belongs_to :user

## sns_productテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

## Association
belongs_to :sns
belongs_to :product


## websites
|Column|Type|Options|
|------|----|-------|
|url|string|-------|

## Association
has_many :products
belongs_to :user



## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, null: false|
|customer_id|string|null: false|

### Association
- belongs_to :user

## receiptsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|-------|
|buyer_id|references|foreign_key: true, null: false|
|seller_id|references|foreign_key: true, null: false|
|product_id|references|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :product



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_kana|string|null: false|
|lastname_kana|string|null: false|
|postalcode|integer|null: false|
|prefecture_id|string|null: false|
|city_name|string|null: false|
|address_number|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association
- belongs_to :user


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|period|string|null: false|
|method|string|null: false|
|price|integer|null: false|
|host_id|references|foreign_key: { to_table: :users }|
|client_id|references|foreign_key: { to_table: :users }|

### Association
- has_many: sns
- has_many: sns_product
- belongs_to :buyer, class_name: "User"
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :comments
- has_many :trade_messages
- has_one :evaluations
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :receipts
- belongs_to :brand
- belongs_to_active_hash :prefecture


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|references|foreign_key: true, null: false|

### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string|index: true|

### Association
- has_many :products
- has_ancestry


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true, null: false|
|user_id|references|foreign_key: true, null: false|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :product


## trade_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true, null: false|
|user_id|references|foreign_key: true, null: false|
|message|text|null: false|

### Association
- belongs_to :user
- belongs_to :product


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|evaluate_id|integer|foreign_key: true, null: false|
|evaluated_id|intefer|foreign_key: true, null: false|
|product_id|integer|foreign_key: true|
|review|text||

### Association
- belongs_to :user
- belongs_to ;product
- belongs_to :evaluate_id, class_name: "User"
- belongs_to :evaluated_id, class_name: "User"





## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|references|foreign_key: true|
|following_id|references|foreign_key: true|

### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|	
|provider|string|null: false|
|user_id|references|foreign_key: true, null: false|

### Association
- belongs_to :user, optional: true
