require 'rails_helper'

describe Receipt do
  describe '#create' do
    it "is valid with a name, price, buyer_id, seller_id, product_id" do
      buyer = build(:user)
      receipt = build(:receipt, buyer_id: buyer.id)
      expect(user).to be_valid
    end
  end
end