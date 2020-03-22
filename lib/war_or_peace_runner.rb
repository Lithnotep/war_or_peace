require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


#intro

class Start

end


deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


card_holder = []
card_ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]






binding.pry
end
