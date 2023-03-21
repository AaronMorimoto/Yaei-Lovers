class Public::HomesController < ApplicationController
  
  def top
    # @posts = Post.all
    @posts = Post.all.page(params[:page])
  end

  def how_to
  end
  
end
