class Area < ApplicationRecord

  has_many :hotels, dependent: :destroy

  validates :area_name, presence: true

end
