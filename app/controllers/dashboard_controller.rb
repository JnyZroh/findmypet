class DashboardController < ApplicationController
  def index
    @pets = current_user.pets
    # raise
  end

  def messages
    @chatrooms = Chatroom.where(user_one: current_user).or(Chatroom.where(user_two: current_user))
  end
end
