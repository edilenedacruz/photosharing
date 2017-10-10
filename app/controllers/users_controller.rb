class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.slug)
      else
        render :new
      end
  end

  def show
    # binding.pry
    @user = User.find_by_slug(params[:slug])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :phone, :avatar_url, :password, :password_confirmation)
  end
end
