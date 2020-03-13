class Sns < ApplicationRecord
  belongs_to :user
  has_many :product, through: :sns_product
  has_many :sns_product
end
