class Message < ActiveRecord::Base

  def encode_message(message)
    "#{message} from Ruby!" # stubbed method to return the same message
  end

end
