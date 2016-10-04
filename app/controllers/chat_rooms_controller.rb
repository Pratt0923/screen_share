# chat rooms controller is the single controller that deals with messages
class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if params[:chat_room][:github_url].include?('https://github.com/')
      @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

# TODO: I want users to be able to sort their project into a language category.
# Or multiple languages. I want users to be able to search through those languages
# and find projects with the languages that they want to work in.

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def edit
    @chat_room = ChatRoom.find(params[:id])
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :description, :github_url)
  end
end
