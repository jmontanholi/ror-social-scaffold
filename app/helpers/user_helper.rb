module UserHelper
  def add_friend(user)
    if user_signed_in? && !current_user.friendships.find_by(friend_id:user.id) 
      link_to('Add Friend', add_friend_path(friend_id: user.id), method: :post)
    end
  end
end