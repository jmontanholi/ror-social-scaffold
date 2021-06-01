class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def friends_and_own_posts
    Post.where(user: (current_user.friends.to_a << current_user))
  end

  def timeline_posts
    # @friendships_friends = current_user.friendships.where(status: 'Accepted').map do |friendship|
    #   User.find(friendship.friend_id)
    # end
    # @inverse_friendships_friends = current_user.inverse_friendships.where(status: 'Accepted').map do |friendship|
    #   User.find(friendship.user_id)
    # end
    # @friends = @friendships_friends + @inverse_friendships_friends
    # @friends_posts = @friends.map { |friend| friend.posts.all }
    # @user_posts = [current_user.posts.all]
    # @posts_to_show = @friends_posts + @user_posts
    @timeline_posts = friends_and_own_posts
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
