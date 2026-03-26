class Tree < ApplicationRecord
  belongs_to :site

  validates :tree_id_external, presence: true, uniqueness: true
  validates :botanical_name, presence: true
end