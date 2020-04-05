class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :sns
  has_many :bought_products, class_name: "Product", foreign_key: "client_id"
  has_one_attached :avatar
  has_many :buy_receipts,  class_name: "Receipt", foreign_key: "buyer_id"
  has_many :sold_receipts, class_name: "Receipt", foreign_key: "seller_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
