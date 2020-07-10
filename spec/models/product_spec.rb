require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with name, description, period, price"
      product = build(:product)
      product.valid?
      expect(product).to be_valid
    end
  end
end