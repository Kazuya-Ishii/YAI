class FavoritesController < ApplicationController
  before_action :set_variables, only: %i[create destroy]

  def index
    @favorite_topics = current_user.favorite_topics
end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    favorite.destroy
   end

  def set_variables
    @topic = Topic.find(params[:topic_id])
    @id_name = "#favorite-link-#{@topic.id}"
  end
end
