class ReviewComment < ApplicationRecord

  belongs_to :review
  belongs_to :member

  validates :comment, presence: true

end
