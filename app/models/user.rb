class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :bought_products, class_name: "Product", foreign_key: "client_id"
  has_many :selling_products, class_name: "Product", foreign_key: "host_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
