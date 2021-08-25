class PasswordResetsController < ApplicationController
  def index
    render :new
  end

  def new
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Password reset link has expired."
    elsif
      @user.update(password_params)
      redirect_to root_path, notice: "Password has been reset. Please log in."
    else
      render :edit
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      user.send_password_reset
      redirect_to root_path, notice: "If an account exists with that email address,
        a message will be sent soon with instructions to reset the password."
    end
  end

  private
  def password_params
    params.permit(:password, :password_confirmation)
  end
end