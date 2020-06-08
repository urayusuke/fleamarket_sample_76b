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
  end
  
end
