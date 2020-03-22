require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_52_cards
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    card_holder = []
    card_ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    card_suits = [:heart, :diamond, :club, :spade]

    assert_equal card_holder = []
  end 
