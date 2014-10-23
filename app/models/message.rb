class Message < ActiveRecord::Base

  attr_accessor :message, :message_length_key

  def initialize(message_input)
    @message = message_input
    @message_length_key = message.length.to_s[-1].to_i
  end

  def library(input)
    phrase_library = {
      'a' => ["buy now & forevar ","bucket filled with ","tens of ","thousands ","more and ","even more but ","butter is not enough ","for u and ","ninety ","the bees are everywhere "],
      'b' => ["LOANS PRICE ","really? But ","Grand PRize Sweepstakes! ","say here? you don't call or write, ","grandmothers & papas together ","new car? Deserve it for her ","forgiven ZIPPO Status","Zipcar Hermes Vuitton","German Shepard Pit Bull ","barbequeue on Satanday ","threw down fifteen storeys"],
      'c' => ["enhancement For U ","owls planning ","can' wait to see you","Could you hold my tie ","Do a favor, a pall, a chum ","old schoolyard days ","big puff and expelled the ","hand it over! GUILTY ","urging to forget the BIG ","pumpkins savor the dishes "],
      'd' => ["enormously big ","cadillac FACTORY ","shop of wonderful ","Porcelain Televisions designed to ","so enticing! a worry, a dripping ","classifieds? Job now on website ","learn GOETHE ","Salisbury salmon catching ","classes all summer and winter ","Can't breathe? Try "],
      'e' => ["on SALE NOW ","elbows akimbo ","fornight fever? ","textile gremlins eating ","burger queen in her fiefdom ","hand-sewn gin coozies ","turkey says gubernatorial ","radio city best buy circuit ","bicycle handymen waiting for ","mattress to a trampoline, she said "],
      'f' => ["Nigerian ","saddle and wearing a ","prime time for ","not? Gather your britches ","drawing circles everyday ","free BANK ACCOUNT ","PERSONAL CHECKING BUSINESS CHEQUE ","investor quality? YEs ","terffic balance to get ","savings, a bust "],
      'g' => ["deals so good ughhh ","pillow table? ","gird up your loins ","I at once warn I not a spam! ","I can send you the photos on e-mail. ","briar patch 90 stalactites","Santiago, the friend of ","inferiority complex living with blood clot. ","explicit, yet full of romance ","ignore the dual voices, "],
      'h' => ["into teeny bits ","Peanutest butter! ","virtuous checkboox ","Chris is dead, Job for you! ","EVery 1 in 10 people ","You won ","solution you've been searching upon ","Maintain your weight. amputate ","yellow go wee wee ","ascent tampon of ultimate "],
      'i' => ["only finest Canadian ","The most ","rich tapestry of luxury ","it will explode, guaranteed ","clam chowderriere ","A madam or madden ","valley of the ","Pokerbot says ","homelessness accreditation ","official manhole bedtime "],
      'j' => ["swing and a ","Is that macaroni in your pockett or are you just ","kitten archbishop ","employ Batarangs all day ","just signup and understand you are a ",", come on! Fill the form and just ","infection taster ","snowman crying when ","12 inch rabbi","An cactus in feline ","join your life "],
      'k' => ["FAST GOOD ","ikea ","expedient toast ","a blind tingling ","the word of Neil ","sasquatch divorce ","new flavor? Pepsi ","real vaccination cowboy ","every cafe is a ","start that fire with your "],
      'l' => ["gargantuan fist of ","nokia n-gage ","Science has proven that every ","tapeworm bike ","taco tuesday in His Kingdom ","elementary fungus choices ","still-warm elephant underwear ","Spiderman Pharmacy ","chemical spill with ","ostrich kisses and/or hugs "],
      'm' => ["LIMITED SECONDS ","vizio repair citadel ","chocolate of magic and colonoscopy ","unfettered desire to handstand ","deep fried cuddling ","mostly irritating, somewhat delightful rashes ","Your name! He demanded, ","enacted in Paris last evening ","the Orleanists! ","Rewind my life including my age "],
      'n' => ["funds depleting ","Oil spill in ","new and innovative?? ","a keen mountain-biker ","an impressive scar running from his eye socket ","bots have been replaced with people ","so attractive, she's so nice! ","getting rich quick was dead? ","Two examples of why it's important ","Best clickbait all night long "],
      'o' => ["~~! ","subway closed forever ","gristle and Tusk merchant ","bus pass gravy ","hamsters, eating all the garbage ","race you to the nuclear cratershell! ","crab landing in space ","just words after all, they don't mean anything ","California dentist? No ","iced tea and beverage rappers "],
      'p' => ["grUndly ","tunnel syndrome ","Literally chop your house payment in half ","Switz cheese syndrome ","*impotent news* ","ALERT: Your Bank ","remedial singles waiting for u ","truck driver circus ","I have a biz for you, ","boy, you tell it. To "],
      'q' => ["business times, ","carpal river ","Forget tattooing ","Hookah bars going to college ","a Taliban swimsuit? ","Dihydrogen monoxide is colorless, odorless, tasteless ","Your profits are DarkProfits ","ATTENTION. Clearance ","Prepay your batch of rockets ","offer won't last! Only "],
      'r' => ["opportunity of a lifetime, my ","metatarsal panini ","denial of sunrise attack ","Hackers Ate My ","re-assess before you ","any destination in the Russian Federation ",". Once, after ","оплодотворением ","Vicodin shower behavior ","fifteen strapping horses breakdancing "],
      's' => ["cold tomatoes for ","salad of pure ragu ","That one guy said ","do that, with your time left on Earth ","the fat guys coalition ","baby shower for dirty children ","i am real person ","Google told me in whispers ","hard breakup for lettuce ","the worst 7 Best Dog Winks "],
      't' => ["police Chief Jim Bravura ","meats over the table ","severe windblown acne. ","resting her eyes on the delicate ","dogs chasing squirrels in TARGET ","clock give a pink slip to ","Now and then, ","plaintiff taxidermists from 1655 ","it takes a real shadow to ","pine cone living wage "],
      'u' => ["times in one night! ","bacon carousel dripping ","How wicked is it? ","the neck bone's connected to the ","binge sniffing ","near tripod is fried. ",". For example, ","cylinder indicates that ","or was it Herman? ","Thundergirl exfoliated a hundred "],
      'v' => ["ripped in feet of passion ","discounts galore, say ","defined by pork chop meditation ","necromancer around mirror ","decepticon becoming man, or ","steam engine forgot his keys ","again, or maybe just the once ","could social barterbarf ","introvert jumprope Olympics ","sandcastle craving bumbershoot "],
      'w' => ["shampoo egg mcmoofin ",". In a short time ","these words: ","so Gary, so soft ","like a hurricane and she thought ","then an entirely different outfit. ","Stays crunchy in ","Bush administration ","tanks Obama ","golden noodle hair. "],
      'x' => ["river danse ","freedom ","don't Picard the ","centipede bakery ","Cobra lessons ","sliming at noon ",". Can't ","catastrophic wonderfarts ","beer gazelle racing to bar ","candy-striped chickadee "],
      'y' => ["court held appearance ","metallic aprons ","Xbox Sony crap ","advertise! All day ","app economy Phone Motorola ","hydrogen atoms suck ","science buffoon ","Madness and Gifford ","shells of their former ","when headlines say: "],
      'z' => ["hell hole of a sasquatch ","conch disaster ","racing on sand in a Chevrolet ",". Taste the ","branding enema ","Bob Ross ponydark ","subversive children's ",", but even more ","portable staircase ","brewery of baked egg whites "],
      'A' =>["unbelievable deal ","great offer for ","can't wait to ",". did I ever tell you ","marshmallow tucus ","bently and his gravy ","Uncle Rumpus said ","dammit, I haven't even ","see the brown ","ducks swimming in the lava "],
      'B' =>["fair house mortgage ","*~*~* ","swiveling around, baseless ","can't even hold a sneeze ","the candle flew across the room ","basting in greenglow ","cheese burger Hamlet","Russian handshake punch ",". Most of them were ","the finest toilet, "],
      'C' =>["act immediately ","hurry upp ","that close to mine? ","Candied gold bums ","teaching to drive ","all of them, whittling ","ghost stories and trombone ","all the world is a baked ","really? Didn't think ","movie actresses demanding thumb wrestles "],
      'D' =>["ghost dollars ","clinet Estwood ","money in the money hole ","pay for college? A waste of ","serpents' tax returns ","lawyer eggs hatching ",". Don't miss ","won't belive what I won't tell you ","listen for the snoring ","blanket forts bulldozed for highway "],
      'E' =>["trombone mostly ","Bab Saougat ","clay-man pigeon ","I said a log puller ","the magic word is ",", can't you just ","curtailed beef kaleidoscope ","amusement park surgery ","blood center high school ","Farmville dollar coin purgatory "],
      'F' =>["street fighter champion ","sandwich makeur ","parkour inside? Never ","all of the ","kitschy organic gerbil ","rum raisin-turned ","tax collector and ","tiddlywinks world pennant ","corn enthusiast ","sleepwalking submarine rudness "],
      'G' =>["THE MOON ","fifteen goods ","your money back? And how ",". You can definitely try ","what ails ya? ","Did you even try ","pull it back to the left ","Deli Cafe open all night ","try the scrambled Joes ","coffee on an roll "],
      'H' =>["marmalade witches ","carpentry bastards ","can't blame 'em for ","? Did they even ","smoking again, the ","cat has evacuated the luggage ","my dog, your godlet ","gibbon in a speedo ","no hang-ups about ","bad burritos and "],
      'I' =>["forty cravens ","leopard queens ",". Listening is pointless, ","give a chance? Nope ","scratch it like just that ","couch dovetailing on ","smooth, glittery ","pumpernickel astronaut ","the next election cylon ","clothing is underrated ","astronomical mistakes "], 
      'J' =>["kign of crabs ","great good goblins ","movies and lessons about ","Norway's own ","tooth academy 5 ","pockets full of stencils ","catastrophy bag ",". Yesterday ","could you even ","ain't nobody got time for "],
      'K' =>["TODAY TODAY RIGTH AWAY ","god damn lies ","purely auto-tuned ","organic, low-fat ","baseball Jesus ","Facebreak from the book ","gibberish and religious fervor ","? On the table, a ","the FDA and ","take it away. "],
      'L' =>["pour another one ","FRANK MILLER's ","recombinant tricycle ","motordiaper for bikers ","serial television cleansing ","programming programs for ","ads in the bathroom hallways? ","can't no way, no how ","learn you to ","yeti houseboat "],
      'M' =>["javelin poppin ","car elevator vroom ","fluffhead pastry shop","knock-off CHEAP in the ","car won't start? Try ","meet hundreds of molting ","'with this one simple trick' =>","Break open a closet door ","biking for days without air in the ocean ","ludicrously temperate leiderhosen "],
      'N' =>["no man baseball ","bad jimmies ","a dozen fingerfrogs ","song lyrics about Alzheimer's ",". Night School might be ","can't say? Already ","probably the best. ","packed all the bags full with ","penicillin, nicotine and ","oatmeal packets or something "],
      'O' =>["right straight away, ","cricket patch ","spider memories ","winters in the basement ",". For years ","can't see rainbows anymore ","that book fell apart. ","Stop! ","flex and burp together ","jump over a tiny doglet "],
      'P' =>["SO MUCH ","baseless horoscope ","peanut reasoning ","could ever hope to ","started makin' trouble in my neighborhood ","Pizza Kingdom of ","could you ever? ","try as I might, ","the concert deflated ","bounce house real estate "],
      'Q' =>["mummified dolphindroid ","eloquent raizers ","band name guacamole","tortilla breakfast smootie ","run around for hours? ","on the bed, ","gasping for jello ",". Until then, ","small wears appeared, singing ","like they had rehearsed "],
      'R' =>["king German ","grumbling soundblaster ","gurgling baby naps ","thew up, but only ","try again? Just ","pickle juice bath ","cleaned your elbows ","paper eyelids flapping ","in the breeze, ","not even a care "],
      'S' =>["how can you fart? ","Learn tricks and trips ","ride a bike, no money ","seriously underfunded ","venture crapital ","seizure the day ","Oh, have fun yourself, ","just for the afternoon ",". And then, ","barking fish awakened me "],
      'T' =>["vacation ca TIOn ","sign your pitty ","knock the vending machine, ","again? Not quite ","Sometimes, ","novocaine jacket ","became a Painter ","tripped in the basement hole ","lead paint? Nah, just ","free fire pits TOMORROW "],
      'U' =>["trippy toes ","crept on the windowsell ","an orange peanut? For me? ","videogames on the slide ","crepe of seduction ","canned spinach futures ","serious tactical ","crackled and popped ","next to the furnace ","tissue paper, brah "],
      'V' =>["rutabager eater ","algebra braintruster ","carnival spitoon ","coarse elven tongue ",". All of them, ","their wild, feral ","couldn't even bat a ","courted for days, weeks, ","madly in love or somethign ","can't eat, sleep or jazzhands "],
      'W' =>["Carven imagur ","reddits pajams ","? It's the bee's ","Mayday, mayday, ","most eloquent of parakeets ","John Legend in his own mind, ","move the couch tomorrow ","BIG DEALS so big! ","free samples for EVER! ","!! "],
      'X' =>["cartoon skips ","rabbit nightmare ","Sammy bologna ","skipped forever ","even in this neighborhood, ","my hairdresser, a lovely ","farmed out for the season? ","Apples and berries or something ",", stuck in Elevator with ","hours, going on and on about "],
      'Y' =>["Spike elevation ","film terrorist ","cardboard salmonella ","that raggedy supervisor, ","can't stand you either ","this side of things. If I could find ","dig around, or ","which aisle? Look up ","no smoking here, ","Stop dancing! "],
      'Z' =>["sandy bagelry ","lunch bonnet ","foreign uvula ","broken handlebar gum ","free jobs TOMORROW ","JOB JOB JOB ","goat reading glasses ","cocktail jammies ","post office gumption ","100% discounted mail-order "],
      "0" => ["those lovely ","how could they! ","a burger? ","gallons galore ","stretched in the shade ","freshly-cut salmonella ","riverside layer ","cars parked and ","left out for days, ","and a two times and a "],
      "1" => ["cartoon divorce court ","baked spleen casserole ","gargantuan raisinets ","a cantaloupe? Surely, ","tennis of all kinds ",". Belcher says ","a quarter of the time ","REFUNDS ",". Wait! But there's ","spinning the wheel "],
      "2" => ["how many times? ","in the great cold ","alas, ","but not so fast ","little boy, ","you're going to ","one-way ticket to ","the golden chance to ","cunning turtles parked ","winter coat circus "],
      "3" => ["smells like alienation? ","can't be, no, ","only one method ","a shrub? Or ","the existence as uttered forth ","try Harder! ","lights full up with bubbles ","the task of inspiring ","Fight some more! ","do 1,000 pushups "],
      "4" => ["could it be? ","skip ads now ","end of the day, ","ultimately, a bunch of ","all that matters? ","to care because it's ","detain showdown ","canteen musicians ","used kumquats ","CHEAP rotting "],
      "5" => ["sold? Not yet ","give me another ","can't, won't, ","slow down a bit ","for the good of ","a pink slip to ","pilot onlooker ","fought through summer ","former trainee ","ballerina pinata "],
      "6" => ["hamburger presentation ","bagel competition? ","neighborhood mastermind ","games of leisure ",". Courting ","a red rose ","spackled birdhouse ","lightning fingertips ","down darkened corridors ","mysterious blinker "],
      "7" => ["strides of physical culture, ","the statue did it! ","can't you see? ",". Don't believe that ","have to try ","winking all night long ","broke the bannister ","plumbing emergency ","doctor Nitrogen ","laughing hysterically "],
      "8" => ["hyena bubble bath ","cantaloupe edgecase ","translate better? Nonsense ","madness in barrels ","shipping contraption ","power kegstand ","sport fishing for ",". Having an average ","weekend lasted just ","for reasons unknown "],
      "9" => ["sketch tragedy ","real stand-up fish ","trapped in the balloon! ","rising, rising, ","top-shelf nighmares ","DANCING all ","project maypole ","medieval vasectomy ","pulp road trip ","hippie-stained "],
      "%" => ["believe! Really ","finish it already ","the book was sent ","publisher money ","first advance fulfilled ","broke on the street? ",". Quiet ","saved up for ","living on a boat ",". Alarms wildly "],
      "?" => ["collapsable nursey ","daycare CHEEP ","expensive! How do you ","learn tricks from this ","can't believe it's not ","commercials made me ",". Really? How can you ","amusement festival for retired ","puppets with fanbases say ","not even funny, OK maybe a little "],
      "!" => ["so many, ","great unknown ","astronauts? Who's counting, ","stickler for the ghouls ","sausage banquet ","no delay! SHOP ","new Web Sites glistening ","Movie commando & ",". Can't be - no, you ","filed in slowly, all "],
      "," => ["cheese tubers ","tertiary diarrhea ","unplanned gulping for hours ","swept me off my coccyx ","tailbone ailments ","no longer a dollar store - ","Can't wait! Buy BUY ","sell timeshare CONDO ","ski for winter? ","all-access pass "],
      "." => ["marvelous, the ","castle trying to play ","submissions NOW OPEN ","no deposit only ","10% unBEATABLE ","DONT DELAY ",". Or, if you follow ","world media, because ","a wonderful muppet became ","such sights, right? "],
      "'" => ["can't poop tomorrow ","send spam lovely ","flowers? Oh heavens ","cooped up in this ",". Where was I, oh ","dungeons and potlucks ","feed the bird thing! ","One more won't kill you, ","probably (I guess), ","it must be a good idea. "],
      '‡' => ["the manner of ","bagels, and ","silky ","muffin ","calamity ","since ","always a ","plus ","the truth ","certainly, "],
      "\n" => ["tremendous ","crispy ","believer of ","witness ","broken-down ","- but - ","stood ","rocky ","shipwreck ","hambone "],
      '♤' => ["tremendous ","crispy ","believer of ","witness ","broken-down ","- but - ","stood ","rocky ","shipwreck ","hambone "]
    }
    character = input[:letter] if input[:letter]
    if character
      if !phrase_library[character].nil?
        return phrase_library[character][message_length_key]
      else
        return character
      end
    else
      phrase_library.each do |k,v| 
        v.each do |phrase|
          message.gsub!(phrase,k.to_s) if message.include?(phrase)
        end
      end
      message
    end
  end

  def encode_message
    new_message = []
    message.gsub(" ","‡").gsub(/\n/,"♤").split("").each do |letter|
      new_message << (encode_letter_in_phrase(letter))
      @message_length_key += 1
      @message_length_key -= 11 if @message_length_key > 9
    end
    add_spaces(new_message)
    new_message.join("").strip
  end

  def add_spaces(message)
    num_spaces = message.length/10.floor 
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

  def decode_message
    @message = remove_spaces
    @message << " "
    message_reverse_engineer.gsub("‡"," ").strip
  end

  def remove_spaces
    message.gsub("\n\n","")
  end

  def message_reverse_engineer
    library(message: message)
    message
  end

end
