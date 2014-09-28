class MessagesController < ApplicationController

  def index
  end

  def new
    message = params[:message]
    if params[:operation] == 'encode'
      result = Message.new.encode_message(message)
    else
      result = Message.new.decode_message(message)
    end
    render json: result.to_json
  end

end
