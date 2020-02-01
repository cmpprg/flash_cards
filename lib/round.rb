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
    turn = Turn.new(guess, current_card)
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

  def start
    @deck.cards.shuffle!
    total_cards = @deck.cards.length
    puts "Welcome! You're playing with #{total_cards} cards."
    puts "-" * 40
    until @deck.cards.length == 0
      puts "This is card number #{@turns.length + 1} out of #{total_cards}"
      puts "Question: #{current_card.question}"
      guess = $stdin.gets.chomp
      take_turn(guess)
      puts @turns.last.feedback
    end
    puts "******Game Over!******"
    puts "You had #{@number_correct} correct guesses out of #{total_cards} for a total score of #{percent_correct}%"
    until turns.length == 0
      current_turn_category = turns.first.card.category
      puts "#{current_turn_category} - #{percent_correct_by_category(current_turn_category)}% Correct"
      @turns.delete_if do |turn|
        turn.card.category == current_turn_category
      end
    end
  end
end
