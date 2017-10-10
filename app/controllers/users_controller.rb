class UsersController < ApplicationController

  def index

  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    binding.pry
    @user = User.friendly.find(params[:id])
    @user.update_attributes(user_params)
      if @user.save
        flash[:success] = "Account info updated."
        redirect_to user_path(@user)
      else
        @user.errors.full_messages.to_sentence
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :phone, :avatar_url, :password, :password_confirmation)
  end
end
