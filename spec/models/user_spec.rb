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
    it "is invalid without a firstname" do
      user.build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end
    it "is invalid without a lastname" do
      user.build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end
    it "is invalid without a firstname_kana" do
      user.build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end
    it "is invalid without a lastname_kana" do
      user.build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end
    it "is invalid without a birth_year" do
      user.build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end
    it "is invalid without a birth_month" do
      user.build(:user, birth_month: nil) 
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end
    it "is invalid without a birth_day" do
      user.build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    it "is invalid without a phone_number" do
      user.build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end
end