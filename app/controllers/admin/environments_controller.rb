class Admin::EnvironmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_environment, only: [:show, :edit, :update, :destroy]
  
  def index
    @environment = Environment.new
    # @environments = Environment.all
    @environments = Environment.all.page(params[:page])
  end

  def create
    @environment = Environment.new(environment_params)
    if @environment.save
      redirect_to admin_environments_path, notice: "環境タグの新規登録に成功しました。"
    else
      # @environments = Environment.all
      @environments = Environment.page(params[:page])
      render 'index', notice: "環境タグの新規登録に失敗しました。"
    end
  end

  def edit
  end

  def update
    if @environment.update(environment_params)
      redirect_to admin_environments_path, notice: "環境タグの変更に成功しました。"
    else
      render "edit", notice: "環境タグの変更に失敗しました。"
    end
  end

  def destroy
    @environment.destroy
    redirect_to admin_environments_path, notice: "環境タグの削除に成功しました。"
  end

  private

  def environment_params
    params.require(:environment).permit(:name)
  end
  
  def set_environment
    @environment = Environment.find(params[:id])
  end
  
end
