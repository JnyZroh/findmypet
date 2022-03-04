class Poster < ApplicationRecord
  belongs_to :pet
  # belongs_to :user

  validates :address, presence: true

  accepts_nested_attributes_for :pet

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
