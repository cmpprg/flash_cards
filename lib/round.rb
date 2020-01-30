class Round
  attr_reader :deck, :turns
  attr_accessor :number_correct

  def initialize deck
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card())
    @turns << turn
    @number_correct += 1 if turn.correct? == true
    @deck.cards.shift
    turn
  end

  def number_correct_by_category(category)
    correct_from_category = turns.select do |turn|
      turn.card.category == category && turn.correct?
    end
    correct_from_category.length
  end

  def percent_correct
    percent = @number_correct * 100.0 / turns.length
    percent.round(1)
  end

  def percent_correct_by_category(category)
    total_category_guessed = turns.select{|turn| turn.card.category == category}
    percent = number_correct_by_category(category) * 100.0 / total_category_guessed.length
    percent.round(1)
  end

end
