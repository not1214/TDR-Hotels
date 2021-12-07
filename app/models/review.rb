class Review < ApplicationRecord

  belongs_to :hotel
  belongs_to :member

  validates :title, presence: true
  validates :rate, presence: true

end
