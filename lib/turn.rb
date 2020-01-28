class Turn
  attr_reader :guess, :card
  attr_accessor :correct

  def initialize guess, card
    @guess = guess
    @card = card
    @correct = false
  end

  def correct?
    return self.correct = true if guess.downcase == card.answer.downcase
    correct
  end

  def feedback
    return "Correct!" if correct? == true
    "Incorrect!"
  end

end
