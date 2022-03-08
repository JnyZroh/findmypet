class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets
  has_many :posters, through: :pet
  has_many :reports

  has_many :chatrooms_as_user_one, class_name: "Chatroom", foreign_key: :user_one_id
  has_many :chatrooms_as_user_two, class_name: "Chatroom", foreign_key: :user_two_id

  has_one_attached :photo
end
