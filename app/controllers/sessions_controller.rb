class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      login_user!(@user)
    else
      flash.now[:error] = "Invalid username or password"
      render :new
    end
  end
    def destroy
      session[:user_id] = nil
      flash[:notice] = "Logged out successfully"
      redirect_to root_path
    end

    def login_user!(user)
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, you're now logged in"
      redirect_to cities_path
    end

  end
