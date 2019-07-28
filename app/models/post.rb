class Post < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments
  has_many :likes

  validates :content, presence: true, length: { maximum: 140 }

  def user
    User.find(author_id)
  end

  def like(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
