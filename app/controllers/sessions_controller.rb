class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    return render action: 'new' unless @user
    # logged in
    session[:user_id] = @user.id
    login_user!(@user)
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to root_path
  end

  def login_user!(user)
    session[:user_id] = @user.id
    flash[:notice] = "Welcome, you're now logged in"
    redirect_to root_path
  end

end
