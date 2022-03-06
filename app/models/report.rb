class Report < ApplicationRecord
  belongs_to :user
  validates :address, :species, presence: true
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
