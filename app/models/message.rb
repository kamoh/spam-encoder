class Message < ActiveRecord::Base

  attr_accessor :message, :message_length_key

  def library(input)
    phrase_library = {
      a: ["buy now & forevar ","bucket ","tens ","thousands ","more and ","even more but ","butter is not enough ","for u and ","nineety "," flippy softness "],
      b: ["loans ","really? But "],
      c: ["enhancement For U ","owls "],
      d: ["enormously big ","putz canopy "],
      e: ["sale ","elbows "],
      f: ["Nigerian ","saddle "],
      g: ["deals ","pillow table? "],
      h: ["bits ","Peanutest butter! "],
      i: ["Canadian ","The most "],
      j: ["swing ","macaroni "],
      k: ["FAST ","ikea "],
      l: ["tremendous ","nokia "],
      m: ["LIMITED ","vizio "],
      n: ["funds ","vayagrao "],
      o: ["~~! ","subway "],
      p: ["grUndly ","tunnel syndrome "],
      q: ["business ","carpal "],
      r: ["opportunity ","tarsal "],
      s: ["cold tomatoes ","salad "],
      t: ["police Chief Jim Bravura ","meats "],
      u: ["times in one night! ","bacons "],
      v: ["ripped in feet of passion ","discounts "],
      w: ["shamoon ","short time "],
      x: ["river danse ","freedom "],
      y: ["court held appearance ","aprons "],
      z: ["hell hole of a sasquatch ","conches "],
      A: ["unbelievable deal ","great offer "],
      B: ["house mortgage ","*~*~* "],
      C: ["act immediately ","hurry upp "],
      D: ["ghost dollars ","clinet Estwood "],
      E: ["trombone mostly ","Bab Saougat "],
      F: ["street fighter elevent ","sandwich makeur "],
      G: ["THE MOON "," fifteen goods "],
      H: ["marmalade witches ","carpentry bastards "],
      I: ["forty cravens ","leopard queens "], 
      J: ["kign of crabs ","great good goblins "],
      K: ["TODAY TODAY RIGTH AWAY ","god damn lies "],
      L: ["pour another one ","FRANK MILLAR "],
      M: ["javelin poppin ","car elevator vroom "],
      N: ["no man baseball ","bad jimmies "],
      O: ["right straight away, ","cricket patch "],
      P: ["SO MUCH ","baseless horoscope "],
      Q: ["mummified dolphindroid ","eloquent raizers "],
      R: ["king german ","grumbling soundblaster "],
      S: ["how can you fart? ","Learn tricks and trips "],
      T: ["vacation ca TIOn ","sign pitty runnykine "],
      U: ["trippy tae ","crep on the windowsell "],
      V: ["rutabager eater ","albrega braintruster "],
      W: ["Carven imagur ","reddits pajams "],
      X: ["cartoon skips ","rabbit nightmare "],
      Y: ["Spike elevation ","film terrorist "],
      Z: ["sandy bagelry ","lunch bonnet "],
      "?" => ["collapsable nursey ","daycare CHEEP "],
      "!" => ["so many, ","great goobly "],
      "," => ["cheese testicles ","tertiary diarrhea "],
      "." => ["marvelous, the cans ","castle trying to play "],
      "'" => ["can't poop tomorrow ","send spam lovely "],
      ‡: ["the ","bagel ","the ","bagel ","the ","bagel ","the ","bagel ","the ","bagel "],
      "\n" => ["tremmel ","craps "],
      ♤: ["tremmel ","craps "]
    }
    if !input[:letter].nil?
      #binding.pry
      @message_length_key += 1
      #binding.pry
      @message_length_key -= 11 if @message_length_key > 9
      # message_length_key = (0..9).to_a.sample
      if !phrase_library[input[:letter].to_sym].nil?
        return phrase_library[input[:letter].to_sym][@message_length_key]
      elsif !phrase_library[input[:letter]].nil?
        return phrase_library[input[:letter]][@message_length_key]
      else
        return input[:letter]
      end
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
    #binding.pry
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
