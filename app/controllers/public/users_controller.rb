class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  
  def show
    # @posts = @user.posts
    @posts = @user.posts.all.page(params[:page])
  end

  def edit
  end

  def update
    #ゲストユーザーの更新、updateアクションの動作前に，メールアドレスがゲストユーザー用であるかチェックするように設定しています。
    if @user.email == 'guest@example.com'
      redirect_to mypage_path, notice: "ゲストユーザーは更新できません"
    elsif @user.update(user_params)
      redirect_to mypage_path(@user), notice: "ユーザー情報の更新に成功しました。"
    else
      render "edit", notice: "ユーザー情報の更新に失敗しました。"
    end
  end
  
  #お気に入り一覧画面用アクション
  def favorites
    # @posts = @user.posts.all.page(params[:page])
    @favorites = @user.posts.all.page(params[:page])
    #favoriteモデルからwhereメソッドとpluckメソッドを使ってログイン中のuser_idとpost_idを引っ張っててfavoritesに代入しています。
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_index = Post.find(favorites)
  end
  
  #退会確認画面用アクション
  def confirm_withdraw
  end
  
  #退会用アクション
  def withdraw
    #ゲストユーザーの退会、withdrawアクションの動作前に，メールアドレスがゲストユーザー用であるかチェックするように設定しています。
    if @user.email == 'guest@example.com'
      redirect_to mypage_path, notice: "ゲストユーザーは退会できません。"
    else
      @user.update(status: true)
      reset_session
      redirect_to root_path, notice: "ユーザーの退会に成功しました。"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :status, :profile_image)
  end
  
  def set_current_user
    @user = current_user
  end
  
end
