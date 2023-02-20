class Admin::HomesController < ApplicationController
  def top
    if params[:environment_id].present? then
      @posts = Post.where(environment_id: "#{params[:environment_id]}")
    elsif params[:prefecture_id].present? then
      @posts = Post.where(prefecture_id: "#{params[:prefecture_id]}")
    else
      @posts = Post.all
    end
  end
end
