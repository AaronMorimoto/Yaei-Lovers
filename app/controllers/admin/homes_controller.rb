class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    
    #環境タグでを指定した際の一覧表示
    if params[:environment_id].present? then
      @posts = Post.where(environment_id: "#{params[:environment_id]}")
    #県名タグでを指定した際の一覧表示
    elsif params[:prefecture_id].present? then
      @posts = Post.where(prefecture_id: "#{params[:prefecture_id]}")
    else
    #管理者ログイン後などに表示する全投稿一覧
      # @posts = Post.all
      @posts = Post.page(params[:page])
    end
  end
  
end
