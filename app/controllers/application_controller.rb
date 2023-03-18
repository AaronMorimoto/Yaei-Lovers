class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #ヘッダーの検索機能
  def search
    # @environments = Environment.all
    @environments = Environment.page(params[:page])
    # @prefectures = Prefecture.all
    @prefectures = Prefecture.page(params[:page])
    # @posts = Post.all
    @posts = Post.page(params[:page])
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
