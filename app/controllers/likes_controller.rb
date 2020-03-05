class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @user = current_user
    @likes = Likes.where(user_id: @user.id).all
  end
  
  def create
    user = current_user
    micropost = Micropost.find(params[:micropost_id])
    user.favorite(micropost)
    flash[:success] = 'お気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = current_user
    micropost = Micropost.find(params[:micropost_id])
    user.unfavorite(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
