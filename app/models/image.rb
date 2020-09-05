class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  belongs_to :product
end