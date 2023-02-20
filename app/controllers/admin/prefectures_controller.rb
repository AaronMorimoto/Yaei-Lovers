class Admin::PrefecturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_prefectures, only: [:show, :edit, :update, :destroy]
  
  def index
    @prefecture = Prefecture.new
    @prefectures = Prefecture.all
  end

  def create
    @prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to admin_prefectures_path
    else
      @prefectures = Prefecture.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @prefecture.update(prefecture_params)
      redirect_to admin_prefectures_path
    else
      render "edit"
    end
  end

  def destroy
    @prefecture.destroy
    redirect_to admin_prefectures_path
  end

  private

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
  
  def set_prefectures
    @prefecture = Prefecture.find(params[:id])
  end
  
end
