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
end
