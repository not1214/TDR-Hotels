class Picture < ApplicationRecord
  attachment :image, type: :image

  validates :image, presence: true
  validates :image_name, presence: true
end
