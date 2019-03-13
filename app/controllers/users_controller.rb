class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
      if @user.save
        redirect_to root_path ,success: 'Welcome to YAI'
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
