class TopicsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :delete]
  before_action :correct_user, only:[:edit, :update, :delete]
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

#binding.pry
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path
    else
      flash.now[:danger]
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find_by(id:params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "Topic updated"
      redirect_to topic_path
    else
      render 'edit'
    end
  end

  def destroy
    @topic = Topic.find_by(id:params[:id])
    @topic.destroy
    redirect_to topics_path
  end



  private
  def topic_params
    params.require(:topic).permit(:image, :video, :description, :category, :title)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "please log in."
      redirect_to login_path
    end
  end


  def correct_user
    @topic = Topic.find_by(id:params[:id])
    redirect_to(root_path) unless @topic.user_id == current_user.id
  end
end
