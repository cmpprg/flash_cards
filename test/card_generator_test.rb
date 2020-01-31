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
end
