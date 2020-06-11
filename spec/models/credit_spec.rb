require 'rails_helper'

describe Credit do
  describe '#pay' do
    it "user_idが空欄だと登録できないこと" do
      # user_idなしでデータ作成
      credit = build(:credit, user_id: nil)
      # バリデーションされているかどうか
      credit.valid?
      # user_idがなかったときのエラーメッセージで"can't be blank"が含まれているかどうか
      expect(credit.errors[:user_id]).to include("can't be blank")
    end

    it "card_idが空欄だと登録できないこと" do
      credit = build(:credit, card_id: nil)
      credit.valid?
      expect(credit.errors[:card_id]).to include("can't be blank")
    end

    it "customer_idが空欄だと登録できないこと" do
      credit = build(:credit, customer_id: nil)
      credit.valid?
      expect(credit.errors[:customer_id]).to include("can't be blank")
    end  
  end
end

