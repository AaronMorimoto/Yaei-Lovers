class Public::HomesController < ApplicationController
  
  def top
    # @posts = Post.all
    @posts = Post.page(params[:page])
  end

  def how_to
  end
  
end
