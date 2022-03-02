class Poster < ApplicationRecord
  belongs_to :pet
  # belongs_to :user

  validates :address, presence: true
end
