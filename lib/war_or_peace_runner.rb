require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
start_game = gets.chomp
#intro

class Start

end


deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
card_holder = []
card_ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
card_suits = [:heart, :diamond, :club, :spade]
card_ranks.each do |rank|
  card_count = 1
  card + card_count.to_s = Card.new(:heart, card_ranks, card_count)
end











binding.pry
