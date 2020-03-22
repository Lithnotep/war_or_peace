require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


#intro

class Start
  def initialize()
end


deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


card_holder = []


if card_holder.count < 52
  card_count = 1

  card_ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
  14.times do |heart|
    new_card = []
    card_ranks_count = 0
    new_card << card + card_count.to_s = Card.new(:heart, card_rank[card_ranks_count], card_ranks_count + 2)
    card_holder << new_card
    card_count += 1
  end
binding.pry
end
