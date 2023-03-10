# frozen_string_literal: true

class Public::PasswordsController < Devise::PasswordsController
  before_action :confirm_guest_user, only: [:create]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  #ゲストのパスワード再設定メールの送信回避用
  def confirm_guest_user
    #変更しようとしているパスワードのメールアドレスを参照してゲストユーザーであればログイン画面へ移動
    if params[:user][:email] == 'guest@example.com'
      redirect_to new_user_session_path, alert: 'ゲストユーザーのパスワード再設定はできません。'
    end
  end
  
  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
