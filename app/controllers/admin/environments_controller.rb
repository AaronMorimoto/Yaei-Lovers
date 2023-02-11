class Admin::EnvironmentsController < ApplicationController
  
  def index
    @environment = Environment.new
    @environments = Environment.all
  end

  def create
    @environment = Environment.new(environment_params)
    if @environment.save
      redirect_to request.referer
    else
      @environments = Environment.all
      render 'index'
    end
  end

  def edit
    @environment = Environment.find(params[:id])
  end

  def update
    @environment = Environment.find(params[:id])
    if @environment.update(environment_params)
      redirect_to admin_environments_path
    else
      render "edit"
    end
  end

  def destroy
    @environment = Environment.find(params[:id])
    @environment.destroy
    redirect_to admin_environments_path
  end

  private

  def environment_params
    params.require(:environment).permit(:name)
  end
  
end
