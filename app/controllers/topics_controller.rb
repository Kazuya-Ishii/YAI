class TopicsController < ApplicationController
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
    @topic = Topic.find_by(id:params[:id])
    @topic.description = params[:description]
    @topic.save
    redirect_to topics_path
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
end
