class Public::HomesController < ApplicationController
  
  def top
    @posts = Post.all
  end

  def how_to
  end
  
end
