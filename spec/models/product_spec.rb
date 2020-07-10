require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with name, description, period, price" do
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end
    
    it "is invalid without a name" do
      product = build(:product)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    
  end
end