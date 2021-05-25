class FriendshipValidator < ActiveModel::Validator
    def validate(record)
      if record.user_id == record.friend_id
        record.errors.add :base, "A user can't be friends with himself."
      end
    end
end

class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User"
    validates_with FriendshipValidator
end
  