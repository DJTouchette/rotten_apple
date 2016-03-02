class Admin::UsersController < ApplicationController
  
  def index
    user = User.find(session[:user_id])
    if user.admin
      @users = User.all
    else
      redirect_to new_session_path
    end

  end

  def new
    @user = User.new
  end


  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end