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
         
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{11}\z/

  validates :email,             presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX } 
  validates :nickname,          presence: true, length: { maximum: 20 }
  validatas :firstname,         presence: true, length: { maximum: 35 }
  validates :lastname,          presence: true, length: { maximum: 35 }
  validates :firstname_kana,    presence: true, length: { maximum: 35 }
  validates :lastname_kana,     presence: true, length: { maximum: 35 }
  validatas :birth_year,        presence: true
  validatas :birth_month,        presence: true
  validatas :birth_day,        presence: true
  validates :phone_number,      presence: true, on: :registrations, uniqueness: true, format: { with: VALID_PHONE_REGEX }

end
