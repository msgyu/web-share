require 'rails_helper'

describe Sn do
  describe '#create' do
    it "is valid with a user_id, kind, url" do
      sns = build(:sn)
      expect(sns).to be_valid
    end
  end
end