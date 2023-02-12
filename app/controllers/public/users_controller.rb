class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user_info successfully."
    else
      render "edit"
    end
  end
  
  #お気に入り一覧画面用アクション
  def favorites
    
  end
  
  #退会確認画面用アクション
  def confirm_withdraw
    @user = User.find(params[:id])
  end
  
  #退会用アクション
  def withdraw
    @user = User.find_by(email: params[:email])
    @user.update(status: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :status)
  end
  
end
