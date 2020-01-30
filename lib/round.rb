class Round
  attr_reader :deck, :turns
  attr_accessor :number_correct

  def initialize deck
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card())
    @turns << turn
    @number_correct += 1 if turn.correct? == true
    @deck.shift
    turn
  end

  def number_correct_by_category(category)
    correct_from_category = turns.select do |turn|
      turn.card.category == category && turn.correct?
    end
    correct_from_category.length
  end

  def percent_correct
    @number_correct * 100.0 / turns.length
  end
end
