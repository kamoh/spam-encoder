class MessagesController < ApplicationController

  def index
  end

  def new
    message = params[:message]
    result = Message.new.encode_message(message)
    render json: result.to_json
  end

end
