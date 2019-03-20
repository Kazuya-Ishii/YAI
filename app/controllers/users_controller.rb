class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :delete, :following, :followers]
  before_action :correct_user, only:[:edit, :update, :delete, :following, :followers]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #binding.pry
      if @user.save
        log_in @user
        flash[:success] = "Welcome to YAI"
        redirect_to @user
      else
        flash.now[:danger] = "Unable to sign up"
        render :new
      end
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :gender, :birthday, :remarks, :password, :password_confirmation, :image)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "please log in."
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user == current_user
  end
end
