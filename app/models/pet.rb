class Pet < ApplicationRecord
  has_many :posters
  belongs_to :user

  has_many_attached :photos

  validates :name, :species, :breed, :color, :photos, presence: true

  accepts_nested_attributes_for :posters
end
