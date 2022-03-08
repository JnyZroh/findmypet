class Pet < ApplicationRecord
  has_many :posters
  belongs_to :user

  has_many_attached :photos

  accepts_nested_attributes_for :posters
end
