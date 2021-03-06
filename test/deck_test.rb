require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"

class TestDeck < Minitest::Test

  def test_that_object_is_instance_of_deck_class

    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_that_cards_attribute_starts_empty

    deck = Deck.new

    assert deck.empty?
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

  def test_retrieve_cards_in_particular_categories
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_equal 2, deck.cards_in_category(:STEM).length
    assert_equal :STEM, deck.cards_in_category(:STEM)[0].category
    assert_equal :STEM, deck.cards_in_category(:STEM)[1].category

    assert_equal 1, deck.cards_in_category(:Geography).length
    assert_equal :Geography, deck.cards_in_category(:Geography)[0].category

    assert_empty deck.cards_in_category("Pop Culture")
  end
end
