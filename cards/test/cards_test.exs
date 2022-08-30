defmodule CardsTest do
  use ExUnit.Case
  doctest Cards # The comment exemples are include at the test.

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20 # Assert verify if is true
  end

  test "shuffling a deck randomizes it" do # This test no is 100% secure, the deck can return a shuffle similar as last one
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) # Refute return the oposity of assert
  end
end
