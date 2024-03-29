class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post), notice: "コメントの投稿に成功しました。"
    else
      redirect_to post_path(@post), notice: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    if @comment.user_id = current_user.id
      @comment.destroy
      redirect_to post_path(@post), notice: "コメントの削除に成功しました。"
    else
      redirect_to post_path(@post), notice: "コメントの削除は投稿者のみが行えます。"
    end
  end
  
  

  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate, images: [])
  end
  
end
