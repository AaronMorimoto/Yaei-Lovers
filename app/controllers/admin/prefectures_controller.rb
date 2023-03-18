class Admin::PrefecturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_prefectures, only: [:show, :edit, :update, :destroy]
  
  def index
    @prefecture = Prefecture.new
    # @prefectures = Prefecture.all
    @prefectures = Prefecture.page(params[:page])
  end

  def create
    @prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to admin_prefectures_path, notice: "県名タグの新規登録に成功しました。"
    else
      # @prefectures = Prefecture.all
      @prefectures = Prefecture.page(params[:page])
      render 'index', notice: "県名タグの新規登録に失敗しました。"
    end
  end

  def edit
  end

  def update
    if @prefecture.update(prefecture_params)
      redirect_to admin_prefectures_path, notice: "県名タグの変更に成功しました。"
    else
      render "edit", notice: "県名タグの変更に失敗しました。"
    end
  end

  def destroy
    @prefecture.destroy
    redirect_to admin_prefectures_path, notice: "県名タグの削除に成功しました。"
  end

  private

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
  
  def set_prefectures
    @prefecture = Prefecture.find(params[:id])
  end
  
end
