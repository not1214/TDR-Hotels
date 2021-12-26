class Hotel < ApplicationRecord
  # 住所から緯度経度取得
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :hotel_images, dependent: :destroy
  accepts_attachments_for :hotel_images, attachment: :image # refileで画像複数枚アップロード
  belongs_to :category
  belongs_to :area

  validates :category_id, presence: true
  validates :area_id, presence: true
  validates :hotel_name, presence: true
  validates :price_range, presence: true
  validates :caption, presence: true
  validates :website, presence: true
  validates :address, presence: true
  validates :hotel_images, presence: true

  # 評価の平均点
  def avg_rate
    if reviews.empty?
      0.0
    else
      reviews.average(:rate).round(1)
    end
  end

  # ホテル名から検索
  def self.search(search)
    if search
      Hotel.where('hotel_name LIKE(?)', "%#{search}%")
    else
      Hotel.all
    end
  end
end
