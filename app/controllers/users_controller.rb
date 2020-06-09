class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def logout
  end

  def info
  end
  
  def address
  end
  
  def credit
    # credit = Credit.find_by(user_id: current_user.id)
    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      # redirect_to credit_user_path(current_user.id) 
    else
      # Payjp.api_key = Rails.application.credentials[:PAYJP_PRIVATE_KEY]
      Payjp.api_key = 'sk_test_5ba36e12894768954ddeaa4d'
      customer = Payjp::Customer.retrieve(credit.customer_id)
      @default_credit_information = customer.cards.retrieve(credit.card_id)
    end
  end
  
end
