class RegistrationsController < Devise::RegistrationsController
  def new
    @user ||= User.new(sign_up_params)
    @user.validate

    @user.errors.messages.reject! { |param| sign_up_params[param].blank? }
  end

  private

  def sign_up_params
    return {} unless params.key?(:user)
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
