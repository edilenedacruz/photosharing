class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:success] = "You are now logged in."
        redirect_to root_path
      else
        flash[:error] = "Username or Password are Incorrect"
        render :new
      end
  end

  def create_from_google
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    flash[:success] = "You are now logged in."
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
