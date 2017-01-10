class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    puts "ps #{params.to_s}"
    #stream_from 'messages'
    stream_from "chatrooms_#{params['chatroom_id']}_channel"

  end

  def unsubscribed
  end
 
  def send_message(data)
    current_user.messages.create!(body: data['message'], chatroom_id: data['chatroom_id'])
  end

end  