class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:current_user]
      Current.user = User.find_by(id: session[:current_user])
    end
  end

  def require_user_logged_in
    redirect_to sign_in_path, alert: "You must be signed in to access this content"
  end
end
