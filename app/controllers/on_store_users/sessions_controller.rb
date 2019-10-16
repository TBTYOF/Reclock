# frozen_string_literal: true

class OnStoreUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    on_store_user = OnStoreUser.find_by(email: params[:on_store_user][:email])
    if on_store_user.is_quit == "退会済み"
      flash[:danger] = "退会済みアカウントです"
      redirect_to new_on_store_user_session_path and return
    end
    super
  end

  # DELETE /resource/sign_out
  def destroy
  #この時点では通常ログアウトか退会処理後自動ログアウトか区別できない
    if current_on_store_user.is_quit == "退会済み"
      reset_session
      flash[:info] = "退会手続きが完了しました"
      redirect_to new_on_store_user_session_path and return
    else
      super
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
