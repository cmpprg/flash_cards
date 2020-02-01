require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test

  def setup
    @filename = "./data/cards.txt"
    @generator = CardGenerator.new(@filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @generator
  end

  def test_instance_variables
    assert_equal @filename, @generator.filename
    assert_equal [], @generator.cards
  end

  def test_generate_cards_method
    @generator.generate_cards
    assert_equal 3, @generator.cards.length
    assert_instance_of Card, @generator.cards[2]
  end


end
