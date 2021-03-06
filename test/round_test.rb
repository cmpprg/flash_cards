require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

class TestRound < Minitest::Test

  def test_if_it_exists
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_deck_holds_and_returns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_turns_variable_exists_and_is_empty
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_current_card_returns_1st_card_in_deck
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal card1, round.current_card
  end

  def test_take_turn_creates_instance_of_turn_with_all_functionality
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal card1, new_turn.card
  end

  def test_that_take_turn_adds_turn_objects_to_turns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_includes round.turns, new_turn
    assert_equal new_turn, round.turns[0]
  end

  def test_variable_that_counts_number_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_that_deck_will_cycle_to_next_card_after_turn
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")

    assert_equal card2, round.current_card
  end

  def test_that_number_correct_does_not_count_incorrect
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    next_turn = round.take_turn("Venus")

    assert_equal 2, round.turns.count
    assert_equal "Incorrect.", round.turns.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_number_correct_by_category_method
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_percent_correct_method
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct
  end

  def test_percent_correct_by_category_method
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card4 = Card.new("Something?", "Answer", :STEM)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.take_turn("North north west")
    round.take_turn("Answer")

    assert_equal 100.0, round.percent_correct_by_category(:Geography)
    assert_equal 66.7, round.percent_correct_by_category(:STEM)
  end

end
