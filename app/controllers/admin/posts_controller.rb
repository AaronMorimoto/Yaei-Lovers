class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post
  
  def show
    @post_comments = @post.post_comments.all.page(params[:page])
  end
  
  def destroy
    if admin_signed_in
      @post.destroy
      redirect_to admin_root_path, notice: "投稿の削除に成功しました。"
    else
      redirect_to admin_root_path, notice: "コメントの削除は管理者のみが行えます。"
    end
    # @post.destroy
    # redirect_to admin_root_path, notice: "投稿の削除に成功しました。"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :body, :address, :longitude, :latitude, :access, :facility, :contact, :rate)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
