class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def contact
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.where(user_one: current_user, user_two: @user).or(Chatroom.where(user_one: @user, user_two: current_user)).first
    @chatroom = Chatroom.create!(user_one: current_user, user_two: @user) if @chatroom.nil?
    redirect_to chatroom_path(@chatroom)
  end
end
