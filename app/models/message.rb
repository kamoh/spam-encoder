class Message < ActiveRecord::Base

  def encode_message(message)
    new_message = []
    message.gsub(" ","|").split("").each do |letter|
      new_message << (encode_letter_replace(letter))
    end
    add_spaces(new_message)
    new_message.insert(-5,"\n\n").join("")
  end

  def add_spaces(message)
    num_spaces = message.length/24.floor
    i = 0
    num_spaces.times do |chunk|
      message.insert(i+4,"\n\n")
      i += 3 + (i + 5)
    end
  end

  def encode_letter_replace(letter)
    case letter
    when "a"
      "cialis "
    when "b"
      "loans "
    when "c"
      "enhancement "
    when "d"
      "pills "
    when "e"
      "sale "
    when "f"
      "nigeria "
    when "g"
      "deals "
    when "h"
      "hundred "
    when "i"
      "Canadian "
    when "j"
      "swing "
    when "k"
      "FAST "
    when "l"
      "tremendous "
    when "m"
      "LIMITED "
    when "n"
      "funds "
    when "o"
      "~~! "
    when "p"
      "great "
    when "q"
      "business "
    when "r"
      "opportunity "
    when "s"
      "fields "
    when "t"
      "calling "
    when "u"
      "sales "
    when "v"
      "act "
    when "w"
      "did "
    when "x"
      "right "
    when "y"
      "main "
    when "z"
      "scandal "
    when "|"
      "the "
    else
      "#{letter} "
    end
  end

  def decode_message(message)
    original_message = []
    message.split(" ").each do |codeword|
      original_message << (decode_letter_replace("#{codeword} "))
    end
    original_message.join("").gsub("|"," ")
    # ("a".."z").to_a.each do |e| 
    #   puts e 
    # end
  end

  def decode_letter_replace(letter)
    case letter
    when "cialis "
      "a"
    when "loans "
      "b"
    when "enhancement "
      "c"
    when "pills "
      "d"
    when "sale "
      "e"
    when "nigeria "
      "f"
    when "deals "
      "g"
    when "hundred "
      "h"
    when "Canadian "
      "i"
    when "swing "
      "j"
    when "FAST "
      "k"
    when "tremendous "
      "l"
    when "LIMITED "
      "m"
    when "funds "
      "n"
    when "~~! "
      "o"
    when "great "
      "p"
    when "business "
      "q"
    when "opportunity "
      "r"
    when "fields "
      "s"
    when "calling "
      "t"
    when "sales "
      "u"
    when "act "
      "v"
    when "did "
      "w"
    when "right "
      "x"
    when "main "
      "y"
    when "scandal "
      "z"
    when "the "
      "|"
    else
      letter.gsub(" ","")
    end
  end


end
