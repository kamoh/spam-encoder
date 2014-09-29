class Message < ActiveRecord::Base

  def encode_message(message)
    new_message = []
    message.gsub(" ","|").split("").each do |letter|
      # binding.pry
      new_message << (replace_letter_encode(letter))
    end
    # binding.pry
    new_message.join("").gsub("|","")
    # ("a".."z").to_a.each do |e| 
    #   puts e 
    # end
  end

  def replace_letter_encode(letter)
    case letter
    when "a"
      "slfhslk "
    when "b"
      "xulvww "
    when "c"
      "asfxv "
    when "d"
      "avxv "
    when "e"
      "fasfsa "
    when "f"
      "trr "
    when "g"
      "vadwvwv "
    when "h"
      "fasdfasf "
    when "i"
      "sasdfas "
    when "j"
      "2hd "
    when "k"
      "fav "
    when "l"
      "jdfn "
    when "m"
      "dbxb "
    when "n"
      "jfj "
    when "o"
      "p;lkj "
    when "p"
      ".xmv "
    when "q"
      "832ff "
    when "r"
      "pashf "
    when "s"
      "kjpfsa "
    when "t"
      "fkjslpnv "
    when "u"
      "kcnpai "
    when "v"
      "fni2f "
    when "w"
      "dsif9 "
    when "x"
      "fisaohf "
    when "y"
      "0s8fu "
    when "z"
      "slfhslk "
    when "|"
      "alsfh "
    else
      "#{letter} "
    end
  end

  def decode_message(message)
    original_message = []
    message.split(" ").each do |codeword|
      # binding.pry
      original_message << (replace_letter_decode("#{codeword} "))
    end
    # binding.pry
    original_message.join("").gsub("|"," ")
    # ("a".."z").to_a.each do |e| 
    #   puts e 
    # end
  end

  def replace_letter_decode(letter)
    case letter
    when "slfhslk "
      "a"
    when "xulvww "
      "b"
    when "asfxv "
      "c"
    when "avxv "
      "d"
    when "fasfsa "
      "e"
    when "trr "
      "f"
    when "vadwvwv "
      "g"
    when "fasdfasf "
      "h"
    when "sasdfas "
      "i"
    when "2hd "
      "j"
    when "fav "
      "k"
    when "jdfn "
      "l"
    when "dbxb "
      "m"
    when "jfj "
      "n"
    when "p;lkj "
      "o"
    when ".xmv "
      "p"
    when "832ff "
      "q"
    when "pashf "
      "r"
    when "kjpfsa "
      "s"
    when "fkjslpnv "
      "t"
    when "kcnpai "
      "u"
    when "fni2f "
      "v"
    when "dsif9 "
      "w"
    when "fisaohf "
      "x"
    when "0s8fu "
      "y"
    when "slfhslk "
      "z"
    # when " "
    #   "|"
    when "alsfh "
      "|"
    else
      letter.gsub(" ","")
    end
  end


end

# "this is a test message"