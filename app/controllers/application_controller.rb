# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def ensure_admin!
    unless current_user.admin?
      flash[:alert] = "Unauthorized!"

      redirect_to root_path

      false
    end
  end
end
