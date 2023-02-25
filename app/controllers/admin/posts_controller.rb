class Admin::PostsController < ApplicationController
  before_action :set_post
  
  def show
  end
  
  def destroy
    @post.destroy
    redirect_to admin_root_path, notice: "投稿の削除に成功しました。"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :body, :address, :longitude, :latitude, :access, :facility, :contact, :rate)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end
