class Review < ApplicationRecord

  belongs_to :hotel
  belongs_to :member

  attachment :review_image

  validates :title, presence: true
  validates :rate, presence: true

end
