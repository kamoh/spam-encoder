class Message < ActiveRecord::Base

  def encode_message(message)
    new_message = []
    message.gsub(" ","‡").gsub(/\n/,"♤").split("").each do |letter|
      new_message << (encode_letter_replace(letter))
    end
    add_spaces(new_message)
    new_message.join("")
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

  def find_phrase(key)
    phrases = ["once two ","test five seven "]
    phrases[key]
  end

  def encode_letter_replace(letter)
    case letter
    when "a"
      find_phrase(1)
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
    message_reverse_engineer(nm).gsub!("‡"," ")
  end

  def remove_spaces(message)
    message.gsub("\n","baloneys ").split(" ").join(" ").gsub("baloneys ","").gsub("baloneys","")
  end

  def message_reverse_engineer(message)
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
