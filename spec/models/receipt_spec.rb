require 'rails_helper'

describe Receipt do
  describe '#create' do
    it "is valid with a name, price, buyer_id, seller_id, product_id" do
      buyer = build(:user)
      receipt = build(:receipt, buyer_id: buyer.id)
      expect(receipt).to be_valid
    end
    it "is invalid without a name" do
      buyer = build(:user)
      receipt = build(:receipt, name: nil,  buyer_id: buyer.id)
      expect(receipt).to include("を入力してください")
    end
  end
end