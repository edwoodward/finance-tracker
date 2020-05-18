class FriendshipController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "#{friend.full_name} is now your friend"
    else 
      flash[:notice] = 'Could not create friendship'
    end
    redirect_to friends_path

  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Friend removed"
    redirect_to friends_path
  end
end
