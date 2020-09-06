class AccountsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to account_url
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :height, :preferred_weight)
  end
end
