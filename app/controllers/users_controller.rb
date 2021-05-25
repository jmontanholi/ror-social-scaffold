class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def add_friend
    @friend = current_user.friendships.build(friend_id: params[:friend_id], status: 'pending')
   
    if @friend.save
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Friend request sent' }  
      end
    end
  end
end
