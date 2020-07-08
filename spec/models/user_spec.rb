require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, firstname, lastname, firstname_kana, lastname_kana, birth_year, birth_month, birth_day, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "is invalid without a nickname" do
      user.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "is invalid without a email" do
      user.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
  end
end