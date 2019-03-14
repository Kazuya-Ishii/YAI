class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to YAI"
        redirect_to topics_path
      else
        flash.now[:danger] = "Unable to sign up"
        render :new
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :gender, :birthday, :remarks, :password, :password_confirmation)
  end
end
