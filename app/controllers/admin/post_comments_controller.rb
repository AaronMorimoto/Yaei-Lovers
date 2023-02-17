class Admin::PostCommentsController < ApplicationController

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to request.referer
    #@comment = PostComment.find(params[:id])
    #@comment.destroy
  end
  
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end

end
