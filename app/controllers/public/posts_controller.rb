class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #投稿詳細ページでコメントを作成するためのメソッド
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
    #@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have posted successfully."
    else
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated your post successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  
  
  private

  def post_params
    params.require(:post).permit(:name, :body, :address, :longitude, :latitude, :access, :facility, :contact, :rate)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
  
end
