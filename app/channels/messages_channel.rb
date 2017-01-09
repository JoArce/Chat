class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'messages'
  end

  def unsubscribed
  end

  def speak(data)
    message = Message.create! content: data['message']
    ActionCable.server.broadcast 'messages', message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
  
end  