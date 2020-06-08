class CreditsController < ApplicationController

  require 'payjp'

  def new
    credit = Credit.where(user_id: current_user.id)
    redirect_to credit_path(current_user.id) if credit.exists?
  end


  def pay #payjpとCreditのデータベース作成
    # Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
    Payjp.api_key = 'sk_test_5ba36e12894768954ddeaa4d'
    #保管した顧客IDでpayjpから情報取得
    if params['payjp-token'].blank?
      redirect_to new_credit_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to credit_path(current_user.id)
      else
        redirect_to pay_credits_path
      end
    end
  end

  def destroy #Payjpとcreditデータベースを削除
    credit = Credit.find_by(user_id: current_user.id)
    if credit.blank?
    else
      Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(credit.customer_id)
      customer.delete
      credit.delete
    end
      redirect_to new_credit_path
  end

  def show #creditのデータpayjpに送り情報を取り出す
    # credit = Credit.find_by(user_id: current_user.id)
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      redirect_to new_credit_path 
    else
      # Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      Payjp.api_key = 'sk_test_5ba36e12894768954ddeaa4d'
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @default_credit_information = customer.cards.retrieve(credit.card_id)
    end
  end
end
