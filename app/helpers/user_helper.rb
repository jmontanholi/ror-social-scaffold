module UserHelper
  def add_friend(user)
    friendships = current_user.friendships.find_by(friend_id: user.id)
    inverse_friendships = current_user.inverse_friendships.find_by(user_id: user.id)

    (return unless user_signed_in? && (current_user.id != user.id))

    link_to('Add Friend', add_friend_path(friend_id: user.id), method: :post) unless friendships || inverse_friendships
  end

  def show_requests(user)
    html = ''
    if user_signed_in? && (current_user.id == user.id)
      @pending_friendships = user.inverse_friendships.where(status: 'pending')
      @pending_friendships.each do |inverse|
        html << '<br>'
        html << "<p class='friend-request'>Friendship requests from:</p>"
        html << User.find(inverse.user_id).name
        html << link_to(' Accept', accept_friendship_path(id: inverse.id), method: :post, class: 'friendship-btn')
        html << link_to(' Refuse', refuse_friendship_path(id: inverse.id), method: :post, class: 'friendship-btn')
      end
    end
    html.html_safe
  end
end
