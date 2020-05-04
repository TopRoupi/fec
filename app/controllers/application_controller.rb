class ApplicationController < ActionController::Base
  def ensure_admin!
    unless current_user.admin?
      flash[:alert] = 'Unauthorized!'

      redirect_to root_path

      return false
    end
  end
end
