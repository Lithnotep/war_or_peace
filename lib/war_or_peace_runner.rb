require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

p "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora."
p "Type 'GO' to start the game!"
start_game = gets.chomp


deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
turn = Turn.new(player1, player2)
card_holder = []
card_value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
card_count = 0
card_value.each do |value|
  card_count += 1
  card_holder << Card.new(:heart, value, card_count + 1)
  card_holder << Card.new(:diamond, value, card_count + 1)
  card_holder << Card.new(:club, value, card_count + 1)
  card_holder << Card.new(:spade, value, card_count + 1)
end
card_holder.shuffle!(random: Random.new(1))
player1.deck.cards << card_holder.shift(26)
player1.deck.cards.flatten!
player2.deck.cards << card_holder
player2.deck.cards.flatten!
