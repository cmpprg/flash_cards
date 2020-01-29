require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"

class TestDeck < Minitest::Test

  def test_that_object_is_instance_of_deck_class

    deck = Deck.new()

    assert_instance_of Deck, deck
  end

  def test_that_cards_attribute_starts_empty

    deck = Deck.new()

    assert_equal [], deck.cards
  end

  def test_cards_can_holds_card_objects
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 3, deck.cards.count
    assert_kind_of Card, deck.cards[0]
    assert_kind_of Card, deck.cards[1]
    assert_kind_of Card, deck.cards[2]
  end

  def test_count_method_counts_number_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end
end

# pry(main)> deck.count
# #=> 3
#
# pry(main)> deck.cards_in_category(:STEM)
# #=> [#<Card:0x00007fa160a62e90...>, #<Card:0x00007fa161a136f0...>]
#
# pry(main)> deck.cards_in_category(:Geography)
# #=> [#<Card:0x00007fa16104e160...>]
#
# pry(main)> deck.cards_in_category("Pop Culture")
# #=> []
