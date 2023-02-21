class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #ヘッダーの検索機能
  def search
    @environments = Environment.all
    @prefectures = Prefecture.all
    @posts = Post.all
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
