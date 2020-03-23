require './lib/card'
require './lib/deck'
require './lib/player'


class Turn
  attr_reader :player1, :player2, :spoils_of_war, :is_mutual

  def initialize(player1, player2)
  @player1 = player1
  @player2 = player2
  @spoils_of_war = []
  @is_mutual = []
  end

  def start
    p "#{@player1.name} and #{@player2.name} will now battle!"
    current_turn = 1
    until @player1.has_lost? || @player2.has_lost? || type == :war && @player1.deck.cards.count <= 2 || type == :war && @player2.deck.cards.count <= 2 || current_turn == 1000000
      pile_cards
      award_spoils(winner)
        if type == :basic || type == :war
          if type == :basic
          p "Turn #{current_turn}: #{winner.name} wins 2 cards!"
          else
          p "Turn #{current_turn}: WAR! #{winner.name} wins 6 cards!"
          end
        else
          p winner
        end
      @player1.deck.cards.shuffle!(random: Random.new(1))
      @player2.deck.cards.shuffle!(random: Random.new(1))
      current_turn += 1
    end
    if winner == "No Cards"
      if @player1.deck.rank_of_card_at(0..2) == nil
        p "#{@player2.name} has won!"
      elsif @player2.deck.rank_of_card_at(0..2) == nil 
        p "#{@player1.name} has won!"
      end
    elsif @player1.has_lost?
      p "#{@player2.name} has won!"
    elsif @player2.has_lost?
      p "#{@player1.name} has won!"
    else
      p "DRAW"
    end
  end

  def type
    turn_result = nil
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2) && @spoils_of_war == [] || @is_mutual == true
      turn_result = :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 2
      turn_result = :basic
    else @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) || @spoils_of_war.count == 6
      turn_result = :war
    end
      turn_result
  end

  def pile_cards
    mutual_test = []
    if type == :mutually_assured_destruction
      mutual_test << @player1.deck.cards.shift(3)
      mutual_test << @player2.deck.cards.shift(3)
      mutual_test.flatten!
      if mutual_test.empty?
        @is_mutual = false
      else
        @is_mutual = true
      end
    elsif type == :war
     spoils_of_war << @player1.deck.cards[0..2]
     spoils_of_war << @player2.deck.cards[0..2]
     spoils_of_war.flatten!
    else type == :basic
     spoils_of_war << @player1.deck.cards[0]
     spoils_of_war << @player2.deck.cards[0]
     spoils_of_war.flatten!
     @player1.deck.remove_card
     @player2.deck.remove_card
    end
end


  def winner
    if @player1.deck.rank_of_card_at(0) == nil && @player1.deck.rank_of_card_at(2) == nil || @player2.deck.rank_of_card_at(0) == nil && @player2.deck.rank_of_card_at(2)
      "No Cards"
    elsif type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end

  def award_spoils(winner)
    if type == :basic || type == :war
      winner_cards = winner.deck.cards << spoils_of_war
      winner_cards.flatten!
      spoils_of_war.clear
    else
      "No Winner"
    end
  end

end
