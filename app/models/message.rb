class Message < ActiveRecord::Base

  attr_accessor :message
  attr_reader :message_length_key

  def library(input)
    phrase_library = {
      a: ["ARYA ","bucket "],
      b: ["loans ","hams "],
      c: ["enhancement ","owls "],
      d: ["pills ","putz "],
      e: ["sale ","elbows "],
      f: ["nigeria ","saddle "],
      g: ["deals ","derf "],
      h: ["bits ","flurf "],
      i: ["Canadian ","couches "],
      j: ["swing ","macaroni "],
      k: ["FAST ","ikea "],
      l: ["tremendous ","nokia "],
      m: ["LIMITED ","vizio "],
      n: ["funds ","vayagrao "],
      o: ["~~! ","subway "],
      p: ["great ","tunnel syndrome "],
      q: ["business ","carpal "],
      r: ["opportunity ","tarsal "],
      s: ["fields ","salad "],
      t: ["calling ","meats "],
      u: ["sales ","bacons "],
      v: ["act ","discounts "],
      w: ["did ","short time "],
      x: ["right ","freedom "],
      y: ["main ","aprons "],
      z: ["scandal ","conches "],
      ‡: ["the ","bagel "],
      "\n" => ["tremmel ","craps "],
      ♤: ["tremmel ","craps "]
    }
    if !input[:letter].nil?
      return phrase_library[input[:letter].to_sym][message_length_key] if !phrase_library[input[:letter].to_sym].nil?
      return input[:letter]
    else
      phrase_library.each { |k,v| 
        v.each do |phrase|
          message.gsub!(phrase,k.to_s) if message.include?(phrase)
        end
      }
      message
    end
  end

  def encode_message(message)
    @message_length_key = 1
    # @message_length_key = message.length.to_s[0].to_i
    @message = message
    new_message = []
    message.gsub(" ","‡").gsub(/\n/,"♤").split("").each do |letter|
      new_message << (encode_letter_in_phrase(letter))
    end
    add_spaces(new_message)
    new_message.join("").strip
  end

  def add_spaces(message)
    num_spaces = message.length/20.floor 
    i = 0
    num_spaces.times do |chunk|
      message.insert(i+4,"\n\n")
      i += 3 + (i + 5)
    end
    message
  end

  def encode_letter_in_phrase(letter)
    library(letter: letter)
  end

  def decode_message(message)
    @message = message
    @message = remove_spaces
    @message << " "
    message_reverse_engineer.gsub("‡"," ").strip
  end

  def remove_spaces
    message.gsub("\n","baloneys ").split(" ").join(" ").gsub("baloneys ","").gsub("baloneys","")
  end

  def message_reverse_engineer
    library(message: message)
    message
  end

end
