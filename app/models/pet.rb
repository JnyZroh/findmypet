class Pet < ApplicationRecord
  has_many :posters
  belongs_to :user

  accepts_nested_attributes_for :posters
end
