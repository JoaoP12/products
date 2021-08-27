class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_exists = User.find_by_email(user_params[:email])
    if user_exists.present?
      flash[:alert] = "This email is not available"
      render :new
    else
      @user = User.new(user_params)
      if @user.save
        @user.send_registration_confirmation
        redirect_to root_path, notice: "Success! Check your mailbox to confirm your account"
      else
        flash[:alert] = "Something went wrong, please try again"
        render :new
      end
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      ShoppingCart.create(user)
    else
      redirect_to root_path, alert: "User not found"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end