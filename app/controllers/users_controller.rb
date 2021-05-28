class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(:name)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def add_friend
    @friend = current_user.friendships.build(friend_id: params[:friend_id], status: 'pending')

    @friend.save
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Friend request sent' }
    end
  end

  def accept_friendship
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.status = 'Accepted'
    @friendship.save
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Friend request accepted' }
    end
  end

  def refuse_friendship
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.status = 'Refused'
    @friendship.save
    respond_to do |format|
      format.html { redirect_to users_url, alert: 'Friend request refused' }
    end
  end
end
