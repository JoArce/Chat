class MessagesChannel < ApplicationCable::Channel
  def subscribed
#<<<<<<< HEAD me muestra lo que yo tenia echo 
 #   puts "ps #{params.to_s}"
    #stream_from 'messages'
  #  stream_from 'chatrooms_#{params['chatroom_id']}_channel'

#======= puedo ver los cambios que hicieron en mi proyecto
    puts "parameters obtained from subscription: #{params}"
    stream_from "chatroom_#{params['chatroom_id']}_channel"
#>>>>>>> aa5cbbd3dafbd0779ecb83a2f0cd5660d7c9d786 este es mi commit
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(content: data['message'], chatroom_id: data['chatroom_id'])
  end
end
