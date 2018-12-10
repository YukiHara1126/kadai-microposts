class LikesController < ApplicationController
 before_action :require_user_logged_in
 
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.dolike(micropost)
    flash[:success] = 'お気に入りしました'
#    redirect_to micropost
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.undolike(micropost)
    flash[:success] = 'お気に入りを解除しました'
#    redirect_to micropost
    redirect_back(fallback_location: root_url)

  end
end
