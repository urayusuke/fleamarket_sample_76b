require 'rails_helper'

RSpec.describe Credit do
  describe '#create' do
    it "numberがない場合は登録できないこと" do
     @credit = build(:card, user)
     @credit.valid?
     expect(@credit.errors[:number]).to include()
    end

    it "numberが14文字未満だと登録できないこと" do
      card = build(:card, number: 1234567890123)
      card.valid?
      expect(card.errors[:number]).to include("is too short (minimum is 14 characters)")
    end
    
    it "yearがない場合は登録できないこと" do
      card = build(:card, year: nil)
      card.valid?
      expect(card.errors[:year]).to include()
    end

    it "monthがない場合は登録できないこと" do
      card = build(:card, month: nil)
      card.valid?
      expect(card.errors[:month]).to include()
    end

    it "codeが3文字未満の場合は登録できないこと" do
      card = build(:card, code: 12)
      card.valid?
      expect(card.errors[:code]).to include("is too short (minimum is 3 characters)")
    end

    it "codeが5文字以上の場合は登録できないこと" do
      card = build(:card, code: 12345)
      card.valid?
      expect(card.errors[:code]).to include("is too long (maximum is 4 characters)")
    end

    it "nameがない場合は登録できないこと" do
      card = build(:card, name: nil)
      card.valid?
      expect(card.errors[:name]).to include()
    end
  
    # it " 重複したemailが存在する場合は登録できないこと " do
    #   user = create(:user)
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end
  end
end