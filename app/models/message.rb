class Message < ActiveRecord::Base

  attr_accessor :message, :message_length_key

  def library(input)
    phrase_library = {
      a: ["buy now & forevar ","bucket ","tens ","thousands ","more and ","even more but ","butter is not enough ","for u and ","nineety ","flippy softness "],
      b: ["LOANS PRICE ","really? But ","Grand PRize Sweepstakes! ","say here? you don't call or write, ","grandmothers & papas together "," new car? Deserve it for her ","forgiven ZIPPO Status","Zipcar Hermes Vuitton","German Shepard Pit Bull ","barbequeue on Satanday ","threw down fifteen storeys"],
      c: ["enhancement For U ","owls planning ","can' wait to see you","Could you hold my tie ","Do a favor, a pall, a chum ","old schoolyard days ","big puff and expelled the ","hand it over! GUILTY ","urging to forget the BIG ","pumpkins savor the dishes "],
      d: ["enormously big ","cadillac FACTORY ","shop of wonderful ","Porcelain Televisions designed to ","so enticing! a worry, a dripping ","classifieds? Job now on website","learn GOETHE","Salisbury salmon catching ","classes all summer and winter ","Can't breathe? Try "],
      e: ["on SALE NOW ","elbows akimbo ","fornight fever? ","textile rumpelstiltskin ","burger queen in her fiefdom ","fortran COBOL LUA ","turkey says guublenatorial ","radio city best buy circuit ","bicycle handymen waitin for ","mattress to a trampoline, she said "],
      f: ["Nigerian ","saddle and wearing a ","prime time for ","not? Gather your britches","drawing circles everyday ","free BANK ACCOUNT ","PERSONAL CHECKING BUSINESS CHEQUE ","investor quality? YEs ","terffic balance to get ","savings, a bust "],
      g: ["deals so good ughhh ","pillow table? ","gird up your loins ","I at once warn I not a spam! ","I can send you the photos on e-mail. ","briar patch 90 stalactites","Santiago, the friend of ","inferiority complex living with blood clot. ","explicit, yet full of romance ","ignore the dual voices, "],
      h: ["into teeny bits ","Peanutest butter! ","virtuous checkboox "," Chris is dead, Job for you! ","EVery 1 in 10 people ","You won ","solution you've been searching upon ","Maintain your weight. amputate ","yellow go wee wee ","ascent tampon of ultimate "],
      i: ["only finest Canadian ","The most ","rich tapestry of luxury "," it will explode, guaranteed ","clam chowderriere","A madam or madden ","valley of the ","Pokerbot says ","homelessness accreditation","official manhole bedtime "],
      j: ["swing and a ","Is that macaroni in your pockett or are you just ","kitten archbishop ","employ Batarangs all day ","just signup and understand you are a ",", come on! Fill the form and join your life ","infection taster ","snowman crying when ","12 inch rabbi","An cactus in feline "],
      k: ["FAST GOOD ","ikea ","expedient toast ","a blind tingling ","the word of Neil ","sasquatch divorce ","new flavor? Pepsi ","real vaccination cowboy ","every cafe is a ","start that fire with your "],
      l: ["tremendous fist of ","nokia n-gage ","Science has proven that every ","tapeworm bike ","taco tuesday in His Kingdom ","elementary fungus choices ","still-warm elephant underwear ","Spiderman Pharmacy ","chemical spill with ","ostrich kisses and/or hugs "],
      m: ["LIMITED SECONDS ","vizio repair citadel ","chocolate of magic and colonoscopy ","unfettered desire to handstand ","deep fried cuddling ","mostly irritating, somewhat delightful rashes ","Your name! He demanded, ","enacted in Paris last evening ","the Orleanists! ","Rewind my life including my age "],
      n: ["funds depleting ","Oil spill in ","new and innovative?? ","a keen mountain-biker ","an impressive scar running from his eye socket ","bots have been replaced with people ","so attractive, she's so nice! ","getting rich quick was dead? ","Two examples of why it's important ","Best clickbait all night long "],
      o: ["~~! ","subway closed forever ","gristle and Tusk merchant ","bus pass gravy ","hamsters, eating all the garbage ","race you to the nuclear cratershell! ","crab landing in space ","just words after all, they don't mean anything ","California dentist? No ","iced tea and beverage rappers "],
      p: ["grUndly ","tunnel syndrome ","Literally chop your house payment in half ","Switz cheese syndrome ","*impotent news* ","ALERT: Your Bank ","remedial singles waiting for u ","truck driver circus ","I have a biz for you, ","boy, you tell it. To "],
      q: ["business times, ","carpal river ","Forget tattooing ","Hookah bars going to college ","a Taliban swimsuit? ","Dihydrogen monoxide is colorless, odorless, tasteless ","Your profits are DarkProfits ","ATTENTION. Clearance ","Prepay your batch of rockets ","offer won't last! Only "],
      r: ["opportunity of a lifetime, my ","metatarsal panini ","denial of sunrise attack ","Hackers Ate My ","re-assess before you ","any destination in the Russian Federation ",". Once, after ","оплодотворением ","Vicodin shower behavior ","fifteen strapping horses breakdancing "],
      s: ["cold tomatoes for ","salad of pure ragu ","Bob Caustic said ","do that, with your time left on Earth ","the fat guys coalition ","baby shower for dirty chidlren ","i am real person ","Google told me in whispers ","hard breakup for lettuce ","the worst 7 Best Dog Winks "],
      t: ["police Chief Jim Bravura ","meats allonya table ","severe windblown acne. ","resting her eyes on the delicate ","dogs chasing squirrels in TARGET ","clock give a pink slip to ","Now and then, ","plaintiff taxidermists from 1655 ","it takes a real shadow to ","pine cone living wage "],
      u: ["times in one night! ","bacon carousel dripping ","How wicked is it? ","the neck bone's connected to the ","binge sniffing ","near tripod is fried. ",". For example, ","cylinder indicates that ","or was it Herman? ","Thundergirl exfoliated a hundred "],
      v: ["ripped in feet of passion ","discounts galore, say ","defined by pork chop meditation ","necromancer around mirror ","collapsicon becoming man, or ","steam engine forgot his keys ","again, or maybe just the once ","could social barterbarf ","introvert jumprope Olympics ","sandcastle craving bumbershoot "],
      w: ["shampoo egg mcmuffin ",". In a short time ","these words: ","so Gary, so soft ","like a hurricane and she thought ","then an entirely different outfit. ","Stays crunchy in ","Bush administration ","tanks Obama ","golden noodle hair. "],
      x: ["river danse ","freedom ","","","","","","","",""],
      y: ["court held appearance ","aprons ","","","","","","","",""],
      z: ["hell hole of a sasquatch ","conches ","","","","","","","",""],
      A: ["unbelievable deal ","great offer ","","","","","","","",""],
      B: ["house mortgage ","*~*~* ","","","","","","","",""],
      C: ["act immediately ","hurry upp ","","","","","","","",""],
      D: ["ghost dollars ","clinet Estwood ","","","","","","","",""],
      E: ["trombone mostly ","Bab Saougat ","","","","","","","",""],
      F: ["street fighter elevent ","sandwich makeur ","","","","","","","",""],
      G: ["THE MOON "," fifteen goods ","","","","","","","",""],
      H: ["marmalade witches ","carpentry bastards ","","","","","","","",""],
      I: ["forty cravens ","leopard queens ","","","","","","","",""], 
      J: ["kign of crabs ","great good goblins ","","","","","","","",""],
      K: ["TODAY TODAY RIGTH AWAY ","god damn lies ","","","","","","","",""],
      L: ["pour another one ","FRANK MILLAR ","","","","","","","",""],
      M: ["javelin poppin ","car elevator vroom ","","","","","","","",""],
      N: ["no man baseball ","bad jimmies ","","","","","","","",""],
      O: ["right straight away, ","cricket patch ","","","","","","","",""],
      P: ["SO MUCH ","baseless horoscope ","","","","","","","",""],
      Q: ["mummified dolphindroid ","eloquent raizers ","","","","","","","",""],
      R: ["king german ","grumbling soundblaster ","","","","","","","",""],
      S: ["how can you fart? ","Learn tricks and trips ","","","","","","","",""],
      T: ["vacation ca TIOn ","sign pitty runnykine ","","","","","","","",""],
      U: ["trippy tae ","crep on the windowsell ","","","","","","","",""],
      V: ["rutabager eater ","albrega braintruster ","","","","","","","",""],
      W: ["Carven imagur ","reddits pajams ","","","","","","","",""],
      X: ["cartoon skips ","rabbit nightmare ","","","","","","","",""],
      Y: ["Spike elevation ","film terrorist ","","","","","","","",""],
      Z: ["sandy bagelry ","lunch bonnet ","","","","","","","",""],
      "?" => ["collapsable nursey ","daycare CHEEP ","","","","","","","",""],
      "!" => ["so many, ","great goobly ","","","","","","","",""],
      "," => ["cheese testicles ","tertiary diarrhea ","","","","","","","",""],
      "." => ["marvelous, the cans ","castle trying to play ","","","","","","","",""],
      "'" => ["can't poop tomorrow ","send spam lovely ","","","","","","","",""],
      ‡: ["the ","bagel ","","","","","","","",""],
      "\n" => ["tremmel ","craps ","","","","","","","",""],
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
