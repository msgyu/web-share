require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "is valid with a nickname, email, firstname, lastname, firstname_kana, lastname_kana, birth_year, birth_month, birth_day, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a firstname" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end

    it "is invalid without a lastname" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end

    it "is invalid without a firstname_kana" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it "is invalid without a lastname_kana" do
      user = build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: nil) 
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    #valid that column characters less
    it "is invalid without a nickname that has less than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without a firstname that has less thann 35 characters" do
      user = build(:user, firstname: "aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without a lastname that has less than 35 characters" do
      user = build(:user, lastname: "aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid without a firstname_kana that has less than 35 characters" do
      user = build(:user, firstname_kana: "aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user).to be_valid
    end
    it "is invalid without a lastname_kana that has less than 35 characters" do
      user = build(:user, lastname_kana: "aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user).to be_valid
    end
    it "is valid with a phone_number that has less than 11 characters " do
      user = build(:user, phone_number: "11111111111")
      user.valid?
      expect(user).to be_valid
    end

    #invalid that column characters more
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end
    it "is invalid with a firstname that has more than 35 characters" do
      user = build(:user, firstname: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user.errors[:firstname]).to include("は35文字以内で入力してください")
    end
    it "is invalid with a lastname that has more than 35 characters" do
      user = build(:user, lastname: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user.errors[:lastname]).to include("は35文字以内で入力してください")
    end
    it "is invalid with a firstname_kana that has more than 35 characters" do
      user = build(:user, firstname_kana: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は35文字以内で入力してください")
    end
    it "is invalid with a lastname_kana that has more than 35 characters" do
      user = build(:user, lastname_kana: "aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!aaaaaaaaa!")
      user.valid?
      expect(user.errors[:lasttname_kana]).to include("は35文字以内で入力してください")
    end
    it "is invalid with a duplicate phone_number address" do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("はすでに存在します")
    end
  end
end