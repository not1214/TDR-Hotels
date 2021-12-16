class Review < ApplicationRecord

  belongs_to :hotel
  belongs_to :member

  has_many :review_comments, dependent: :destroy

  attachment :review_image

  validates :title, presence: true
  validates :rate, presence: true


end
