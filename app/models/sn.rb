class Sn < ApplicationRecord
  belongs_to :user
  has_many :product, through: :sns_product
  has_many :sns_product

  def mechanize
    require 'mechanize'
    agent = Mechanize.new
    page = agent.get("#{self.url}")
    title = page.search('#text').inner_text
    follower = page.search('#subscriber-count').inner_text
    self.update(follower: follower)
  end
end
