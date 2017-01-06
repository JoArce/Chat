class ChatroomsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_chatroom, only: [:show]


def show

    #@chatroom = Chatroom.find_by(topic: params[:topic])
    @message = Message.new

 end

 def index
 	 @chatrooms = Chatroom.all

     #Chatroom en mayuscula me toma todo el modelo 	 de Chatroom
 end

 def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @chatroom = Chatroom.new
  end


def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        format.html { redirect_to @chatroom }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["El chat que esta creando ya existe"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end



 private 
   def set_chatroom
   	  @chatroom = Chatroom.find params[:id] unless params[:id].blank?

   	  #la busqueda se hace siempre que no sea nulo
   end
   def chatroom_params
      params.require(:chatroom).permit(:topic)
    end

end