class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if params[:chat_room][:github_url].include?("https://github.com/")
      @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
    #if hangouts exists
      hangouts_exists
    #else
      hangouts_does_not_exist
    #end
  end

  def edit
    @chat_room = ChatRoom.find(params[:id])
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :description, :github_url)
  end

  def hangouts_exists
    if @chat_room.user_id == current_user.id
      #make the button be a end a hangouts session
    else
      #make it a join a hangouts button
    end
  end

  def hangouts_does_not_exist
    if @chat_room.user_id == current_user.id
      #button to create a hangouts session
    else
      #greyed out button to join a hangouts session
    end
  end
end
