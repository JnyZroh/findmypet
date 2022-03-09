class PagesController < ApplicationController
  def home
    @posters = Poster.all
    @reports = Report.all
    @chatrooms = Chatroom.where(user_one: current_user).or(Chatroom.where(user_two: current_user))
  end
end
