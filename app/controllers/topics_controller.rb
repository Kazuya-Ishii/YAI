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

  private
  def topic_params
    params.require(:topic).permit(:image, :video, :description, :category)
  end
end
