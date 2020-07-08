require 'rails_helper'

describe User do
  describe '#create' do
    # 1. ユーザーモデルのニックネーム、メールアドレス、氏名、氏名カナ、生年月日、電話番号があれば登録ができること
    it "is valid with a nickname, email, firstname, lastname, firstname_kana, lastname_kana, birth_year, birth_month, birth_day, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end