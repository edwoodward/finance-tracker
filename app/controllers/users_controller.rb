class UsersController < ApplicationController
  def portfolio
    @tracked_stocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    if params[:friend].present?
      @friend = User.search(params[:friend])
      if @friend
        @friend = current_user.except_current_user(@friend)
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Could not find friend"
          format.js { render partial: 'users/friend_result' }
        end
      end
    else 
      respond_to do |format|
        flash.now[:alert] = "Please enter a friend name or email"
        format.js { render partial: 'users/friend_result' }
      end
    end
  end
end
