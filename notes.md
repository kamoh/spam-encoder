Dev process
  - stubbed out page
  - stubbed encode & decode requests in ajax and jquery
  - stubbed out encode and decode methods in model
  - encountered 414 error, message too large
  - naive implementation with chained gsubs to replace letters, but snowballed
  - broke into two case statements, but but works better
  - want to come up with a way to do phrase parsing
  - want to change to hash data structure from case statement for better efficiency, and also to manage multiple possible code words/phrases

Todo

  - change data structure from case statement to hash 
  - incorporate way to reliably select a phrase from the hash value for each letter
  - incorporate a way to decode phrases instead of single code words





- Way to encode messages as spam messages

Stack

- Ruby on Rails
- JavaScript (coffeescript?)
- jQuery
- Angular
- Cucumber

Methodology

- each letter of the message is replaced by a new word or phrase
- 

Kinds of Spam Email

- Ads
  - Drugs (viagra, cialis, percocet, xanax, etc)
  - Deals (watches, electronics, trip)
  - Freebies (software, program licenses)
  - Loans
  - Stocks
- Phishing (your account was hacked, your password expired - twitter, facebook, gmail, craigslist, myspace, friendster)
- Get rich quick (Nigerian prince)
- Virus scares
- Chain letters

- Confusing nonsense
- Pretend correspondence (starting with Re:, non-salesy sentences)
- (no subject)
- Different language (chinese, japanese)

Phrases

- Email Subjects
  
  - Your loan request approved
  - Amaze her with your toy
  - I forgot to leave your number
  - RE: (something)

Character substitution

  - Figure out different frequencies for different characters and add additional substitutions to retain variety
    Reference - http://www.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html

user flow

  - go to site
  - input message 
  - click 'encode to spam'
  - jquery to grab original message from text box, ajax to send to server & translate
  - 




