class Report < ApplicationRecord
  belongs_to :user
  validates :address, :species, presence: true
  has_many_attached :photos
end
