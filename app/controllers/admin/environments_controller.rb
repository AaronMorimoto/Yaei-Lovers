class Admin::EnvironmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_environment, only: [:show, :edit, :update]
  
  def index
    @environment = Environment.new
    @environments = Environment.all
  end

  def create
    @environment = Environment.new(environment_params)
    if @environment.save
      redirect_to admin_environments_path
    else
      @environments = Environment.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @environment.update(environment_params)
      redirect_to admin_environments_path
    else
      render "edit"
    end
  end

  def destroy
    @environment.destroy
    @environment.posts.destroy_all
    redirect_to admin_environments_path
  end

  private

  def environment_params
    params.require(:environment).permit(:name)
  end
  
  def ensure_environment
    @environment = Environment.find(params[:id])
  end
  
end
