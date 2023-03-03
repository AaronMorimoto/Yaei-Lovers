class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    #絞り込み検索用に記述
    if params[:environment_id].present?
       params[:prefecture_id].present?
       #params[:rate].present?
      @posts = Post.where(environment_id: "#{params[:environment_id]}", prefecture_id: "#{params[:prefecture_id]}")
      #@posts = Post.where(environment_id: "#{params[:environment_id]}", prefecture_id: "#{params[:prefecture_id]}", rate: "#{params[:rate]}")
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    #投稿詳細ページでコメントを作成するためのメソッド
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "新規投稿に成功しました。"
    else
      render "new", notice: "新規投稿に失敗しました。"
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿の変更に成功しました"
    else
      render "edit", notice: "投稿の変更に失敗しました。"
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿の削除に成功しました。"
  end
  
  
  
  private

  def post_params
    params.require(:post).permit(:user_id, :environment_id, :prefecture_id, :name, :body, :address, :longitude, :latitude, :access, :facility, :contact, :rate, images: [])
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
  
end
