class PurchaseController < ApplicationController

  require 'payjp'
  before_action :set_product

  def index
    credit = Credit.find_by(user_id: current_user.id)
    if credit.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "credit", action: "new"
    else 
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_credit_information = customer.cards.retrieve(credit.card_id)
    end
  end

  def pay
    credit = Credit.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    Payjp::Charge.create(
    amount: 14000, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: credit.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
    redirect_to action: 'done' #完了画面に移動
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

end
