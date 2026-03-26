class Site < ApplicationRecord
  belongs_to :neighbourhood
  has_many :trees, dependent: :destroy

  validates :location_class, presence: true
  validates :property_type, presence: true
end
