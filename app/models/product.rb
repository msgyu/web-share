class Product < ApplicationRecord
  belongs_to :user
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_many :sns, through: :sns_product
  has_many :sns_product

  validates :name, :description, :period, :user_id, :price, presence: true
  validates :price,numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1000,
    less_than_or_equal_to: 999999,
    allow_blank: true
  }

  validate :category_count
    def category_count
      category_validation = category_ids
      unless category_validation.length >= 1
        errors.add(:category_ids,"選択してください")
      end
    end
end
