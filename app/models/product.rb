class Product < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "host_id"
  belongs_to :client, class_name: "User", foreign_key: "client_id", optional: true
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories


  validate :category_count
    def category_count
      category_validation = category_ids
      unless category_validation.length >= 1
        errors.add(:category_ids,"選択してください")
      end
    end
end
