class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    return render action: 'new' unless @user.save
    login_user!(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username,:password, :password_confirmation, :email)
  end

  def login_user!(user)
    session[:user_id] = @user.id
    flash[:notice] = "Welcome, you're now logged in"
    redirect_to cities_path
  end

end
