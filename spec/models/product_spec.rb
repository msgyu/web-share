require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with name, description, period, price" do
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end
    
    it "is invalid without a name" do
      product.build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a description" do
      product.build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a period" do
      product.build(:product, period: nil)
      product.valid?
      expect(product.errors[:period]).to include("を入力してください")
    end
    
    it "is invalid without a price" do
      product.build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is valid with a name that has less than 40 characters" do
      product.build(:product, name: "aaaaaaaaa!aaaaaaaaa!")
      product.valid?
      expect(product).to be_valid
    end
    it "is invalid with a name that has more than 40 characters" do
      product.build(:product, name: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内に入力してください")
    end

  end
end