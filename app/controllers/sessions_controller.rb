class SessionsController < ApplicationController
  def new
    if Current.user.present?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      if user.email_confirmed
        session[:current_user] = user.id
        redirect_to root_path, notice: "User signed in successfully"
      else
        redirect_to root_path, alert: "Your email was not confirmed yet. Please follow the instructions
          sent to your email address to activate your account."
      end
    else
      flash[:alert] = "Invalid email or/and password"
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path, notice: "Signed out successfully"
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end