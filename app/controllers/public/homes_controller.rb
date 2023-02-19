class Public::HomesController < ApplicationController
  def top
    @environments = Environment.all
    @prefectures = Prefecture.all
    @posts = Post.all
  end

  def how_to
  end
end
