class Turn
  attr_reader :guess, :card

  def initialize guess, card
    @guess = guess
    @card = card
    @correct = false
  end

  def correct?
    correct
  end
end
