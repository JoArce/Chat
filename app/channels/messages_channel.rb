class MessagesChannel < ApplicationCable::Channel
  def subscribed
    puts "parameters obtained from subscription: #{params}"
    stream_from "chatroom_#{params['chatroom_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(content: data['message'], chatroom_id: data['chatroom_id'])
  end
end
