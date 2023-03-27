class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post
  
  def destroy
    if admin_signed_in
      PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
      redirect_to admin_post_path(@post), notice: "コメントの削除に成功しました。"
    else
      redirect_to root_path, notice: "コメントの削除は管理者のみが行えます。"
    end
    # PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # redirect_to admin_post_path(@post), notice: "コメントの削除に成功しました。"
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

end
