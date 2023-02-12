class Admin::PostsController < ApplicationController

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :body, :address, :longitude, :latitude, :access, :facility, :contact, :rate)
  end
  
end
