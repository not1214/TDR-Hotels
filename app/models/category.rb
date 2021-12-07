class Category < ApplicationRecord

  has_many :hotels, dependent: :destroy

  validates :category_name, presence: true

end
