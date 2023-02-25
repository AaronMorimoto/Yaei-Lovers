class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    @comment.save
    redirect_to request.referer, notice: "コメントの投稿に成功しました。"
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer, notice: "コメントの削除に成功しました。"
  end

  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate, images: [])
  end

end
