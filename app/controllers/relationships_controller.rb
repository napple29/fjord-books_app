class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    
    following = current_user.follow(@user)
  end

  def destroy
    following = current_user.unfollow(@user)
  end
end
