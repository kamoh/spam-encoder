class Message < ActiveRecord::Base

  attr_accessor :message
  attr_reader :message_length_key

  def library(input)
    phrase_library = {
      a: ["ARYA "],
      b: ["loans "],
      c: ["enhancement "],
      d: ["pills "],
      e: ["sale "],
      f: ["nigeria "],
      g: ["deals "],
      h: ["bits "],
      i: ["Canadian "],
      j: ["swing "],
      k: ["FAST "],
      l: ["tremendous "],
      m: ["LIMITED "],
      n: ["funds "],
      o: ["~~! "],
      p: ["great "],
      q: ["business "],
      r: ["opportunity "],
      s: ["fields "],
      t: ["calling "],
      u: ["sales "],
      v: ["act "],
      w: ["did "],
      x: ["right "],
      y: ["main "],
      z: ["scandal "],
      ‡: ["the "],
      "\n" => ["tremmel "],
      ♤: ["tremmel "]
    }
    if !input[:letter].nil?
      return phrase_library[input[:letter].to_sym] if !phrase_library[input[:letter].to_sym].nil?
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
    @message_length_key = 0
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
    library(letter: letter)[message_length_key]
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
