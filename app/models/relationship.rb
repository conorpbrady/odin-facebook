class Relationship < ApplicationRecord
  scope :active, -> { where(accepted: true) }
  scope :pending, -> { where(accepted: false) }
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'

end
