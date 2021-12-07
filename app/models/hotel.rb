class Hotel < ApplicationRecord

  attachment :hotel_image

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :area

  validates :category_id, presence: true
  validates :area_id, presence: true
  validates :hotel_name, presence: true
  validates :price_range, presence: true
  validates :caption, presence: true
  validates :website, presence: true
  validates :address, presence: true
  validates :hotel_image, presence: true

end
