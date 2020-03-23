require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_52_cards
    card_holder = []
    card_value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    card_value.each do |value|
      card_count = 1
      card_holder << Card.new(:heart, value, card_count + 1)
      card_holder << Card.new(:diamond, value, card_count + 1)
      card_holder << Card.new(:club, value, card_count + 1)
      card_holder << Card.new(:spade, value, card_count + 1)
      card_count += 1
    end

    assert_equal 52, card_holder.count
  end

  def test_deck_build
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)
    card_holder = []
    card_value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    card_value.each do |value|
      card_count = 1
      card_holder << Card.new(:heart, value, card_count + 1)
      card_holder << Card.new(:diamond, value, card_count + 1)
      card_holder << Card.new(:club, value, card_count + 1)
      card_holder << Card.new(:spade, value, card_count + 1)
      card_count += 1
    end
    player1.deck.cards << card_holder.shift(25)
    player2.deck.cards << card_holder

    assert_equal player1.deck.cards.count, player2.deck.cards.count
  end

end
