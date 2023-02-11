class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @post.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
    #@comment = BookComment.find(params[:id])
    #@comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

end
