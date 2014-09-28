class Message < ActiveRecord::Base

  def encode_message(message)
    "#{message} encoded from Ruby!"
  end

  def decode_message(message)
    "#{message} decoded from Ruby!"
  end
  
end
