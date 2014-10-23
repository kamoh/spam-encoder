class MessagesController < ApplicationController

  def index
  end

  def new
    message = params[:message]
    if params[:operation] == 'encode'
      result = Message.new(message).encode_message
    else
      result = Message.new(message).decode_message
    end
    render json: result.to_json
  end

end
