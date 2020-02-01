require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/card_generator"


class CardGeneratorTest < Minitest::Test

  def setup
    @blank_file = "./data/blank.txt"
    @cards_file = "./data/test_cards.txt"
  end

  def test_it_exists
    generator = CardGenerator.new(@blank_file)

    assert_instance_of CardGenerator, generator
  end

  def test_instance_variables
    generator = CardGenerator.new(@blank_file)

    assert_equal @blank_file, generator.filename
    assert_equal [], generator.cards
  end

  def test_generate_cards_method
    generator = CardGenerator.new(@cards_file)

    assert_equal 3, generator.cards.length
    assert_instance_of Card, generator.cards[2]
  end


end
