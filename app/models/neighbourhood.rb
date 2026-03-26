class Neighbourhood < ApplicationRecord
  has_many :sites, dependent: :destroy

  validates :name, presence: true
  validates :electoral_ward, presence: true
end
