class RegistrationsController < Devise::RegistrationsController
  def new
    @user ||= User.new(sign_up_params)
    @user.validate
    @ramdom = rand 999999
    @params = params
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
