# README

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
- has_many :youtuber
- has_many :websites
- has_many :contents
- has_many :bought_contents, class_name: "content", foreign_key: "buyer_id"
- has_many :selling_contents, -> { where("buyer_id is NULL") }, class_name: "Content", foreign_key: "seller_id"
- has_many :sold_contents, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "content"
- has_many :comments
- has_many :trade_messages
- has_many :evaluations
- has_many :evaluated_users, foreign_key: "evaluated_id", class_name: "Evaluation"
- has_many :likes
- has_many :liked_contents, through: :likes, source: :content
- has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many :followings, through: :following_relationships
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships
- has_many :creditcards
- has_many :sns_credentials, dependent: :destroy
- belongs_to_active_hash :prefecture

## youtuberテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|url|string|-------|
|registration|string|-------|

## Association
has_many :contents
belongs_to :user

## websites
|Column|Type|Options|
|------|----|-------|
|url|string|-------|

## Association
has_many :contents
belongs_to :user



## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, null: false|
|customer_id|string|null: false|

### Association
- belongs_to :user


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
|content_id|references|foreign_key: true|

### Association
- belongs_to :user


## contentsテーブル
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
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :user
- belongs_to :category
- has_many :images
- has_many :comments
- has_many :trade_messages
- has_one :evaluations
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- belongs_to :brand
- belongs_to_active_hash :prefecture


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content_id|references|foreign_key: true, null: false|

### Association
- belongs_to :content


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string|index: true|

### Association
- has_many :contents
- has_ancestry


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content_id|references|foreign_key: true, null: false|
|user_id|references|foreign_key: true, null: false|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :content


## trade_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content_id|references|foreign_key: true, null: false|
|user_id|references|foreign_key: true, null: false|
|message|text|null: false|

### Association
- belongs_to :user
- belongs_to :content


## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false|
|evaluate_id|integer|foreign_key: true, null: false|
|evaluated_id|intefer|foreign_key: true, null: false|
|content_id|integer|foreign_key: true|
|review|text||

### Association
- belongs_to :user
- belongs_to ;content
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
