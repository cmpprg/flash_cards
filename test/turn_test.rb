require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/turn.rb"
require_relative "../lib/card.rb"

class TestTurn < Minitest::Test

  def test_that_object_exists
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_that_it_accepts_arguments
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
    assert_equal "Juneau", turn.card.answer
  end

  def test_that_correct_variable_defaults_to_false
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    refute turn.correct?
  end

  def test_that_it_tracks_correct_and_incorrect_answers
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?

    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn2 = Turn.new("Saturn", card)

    refute turn.correct?
  end

  def test_that_it_can_provide_feedback_for_correct_or_incorrect_answers
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!"

    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn2 = Turn.new("Saturn", card)

    assert_equal "Incorrect!"
  end
end
