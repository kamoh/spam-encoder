class Message < ActiveRecord::Base

  attr_reader :message_length_key

  @phrase_library = {
      a: ["ARYA ","OWEN ","VIOLET ","BENJAMIN ","SOPHIA ","DECLAN ","SCARLETT ","HENRY ","AUDREY ","JACKSON "]
    }

  def encode_message(message)
    @message_length_key = message.length.to_s[0].to_i
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

  def phrase_library(letter={}, operation,message={})
    
    # if operation == "encode"
    #   return library[letter.to_sym]
    # else
      return library.each { |k,v| message.gsub!(v,k) if v.include?(phrase) }
    end
  end

  def encode_letter_in_phrase(letter)
    @phrase_library(letter.to_sym)[message_length_key]

    case letter
    when "a"
      @phrase_library(letter)[message_length_key]
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
      "bits "
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
    when "‡"
      "the "
    when "♤"
      "tremmel "
    else
      "#{letter}"
    end
  end

  def decode_message(message)
    nm = remove_spaces(message)
    nm << " "
    message_reverse_engineer(nm).gsub!("‡"," ").strip
  end

  def remove_spaces(message)
    message.gsub("\n","baloneys ").split(" ").join(" ").gsub("baloneys ","").gsub("baloneys","")
  end

  def message_reverse_engineer(message)
    

    message.gsub!(phrase_library("decode",message))

    message.gsub!(find_phrase(1),"a")
    message.gsub!("loans ","b")
    message.gsub!("enhancement ","c")
    message.gsub!("pills ","d")
    message.gsub!("sale ","e")
    message.gsub!("nigeria ","f")
    message.gsub!("deals ","g")
    message.gsub!("bits ","h")
    message.gsub!("Canadian ","i")
    message.gsub!("swing ","j")
    message.gsub!("FAST ","k")
    message.gsub!("tremendous ","l")
    message.gsub!("LIMITED ","m")
    message.gsub!("funds ","n")
    message.gsub!("~~! ","o")
    message.gsub!("great ","p")
    message.gsub!("business ","q")
    message.gsub!("opportunity ","r")
    message.gsub!("fields ","s")
    message.gsub!("calling ","t")
    message.gsub!("sales ","u")
    message.gsub!("act ","v")
    message.gsub!("did ","w")
    message.gsub!("right ","x")
    message.gsub!("main ","y")
    message.gsub!("scandal ","z")
    message.gsub!("the ","‡")
    message.gsub!("tremmel ","\n")
    message
  end

end
