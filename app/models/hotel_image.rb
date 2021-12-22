class HotelImage < ApplicationRecord

  belongs_to :hotel
  attachment :image

  validates :image, presence: true

end
