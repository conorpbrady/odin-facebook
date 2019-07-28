class Post < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments

  validates :content, presence: true, length: { maximum: 140 }

  def user
    User.find(author_id)
  end
end
