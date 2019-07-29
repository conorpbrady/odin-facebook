class Comment < ApplicationRecord
  belongs_to :user, optional: true
  validates :content, presence: true, length: { maximum: 140 }



  def user
    User.find(author_id)
  end
end
