class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_post
  
  def create
    # post = Post.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comment_params)
    # @comment.post_id = post.id
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
  
  # 画像アップロード用のアクション
  def comment_upload_image
    @comment_image_blob = create_blob(params[:image])
    render json: @comment_image_blob
  end
  
  

  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment, :rate, images: []).merge(images: comment_uploaded_images)
  end
  
  # コメントのアップロード済み画像の検索
  def comment_uploaded_images
    params[:post_comment][:images].drop(0).map{|id| ActiveStorage::Blob.find(id)} if params[:post_comment][:images]
  end
  
  # blobデータの作成
  def create_blob(file)
    ActiveStorage::Blob.create_and_upload!(
      io: file.open,
      filename: file.original_filename,
      content_type: file.content_type
    )
  end
  
  # def set_post
  #   @post = Post.find(params[:id])
  # end

end
