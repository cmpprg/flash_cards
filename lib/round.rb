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
end
