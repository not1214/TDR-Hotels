class HotelImage < ApplicationRecord
  belongs_to :hotel
  attachment :image, type: :image

  validates :image, presence: true
end
