class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: email_params[:email])
    if user && user.authenticate(password_params[:password])
      log_in user
      redirect_to user_path(user), success: 'Login Successfully'
    else
      flash.now[:danger] = 'Sorry, your username(ID) or password cannot be recognized.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end


  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def email_params
    params.require(:session).permit(:email)
  end

  def password_params
    params.require(:session).permit(:password)
  end
end
