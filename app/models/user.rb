class User < ApplicationRecord


  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes

  has_many :pending_requests, class_name: "Relationship", foreign_key: "requested_id"
  has_many :sent_requests, class_name: "Relationship", foreign_key: "requester_id"

  #has_many :friends, through: :relationships, source: :requester
  #has_many :friend_requests, through: :relationships, source: :requested


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



   def friends
     @friends = Relationship.where("requester_id = ? OR requested_id = ?",
                                     id, id)
   end

   def friend(user)
     Relationship.where("(requester_id = ? AND requested_id = ?) OR (requester_id = ? AND requested_id = ?)",
                            id, user.id, user.id, id).first
   end

   def friends_with?(user)
      relationship = Relationship.where("requester_id = ? OR requested_id = ?", user.id, user.id)
      return nil if relationship.nil?
      return relationship.accepted
    end

    def friends_users_ids
      friends_arr = [id]
      friends.active.each do |friend|
        f = id == friend.requester_id ? friend.requested_id : friend.requester_id
        friends_arr << f
      end
      friends_arr
    end
end
