class Receipt < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  belongs_to :product

  validates :name, :price, :buyer_id, :seller_id, :product_id, presence: true
end
