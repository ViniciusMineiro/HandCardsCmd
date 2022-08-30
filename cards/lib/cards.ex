defmodule Cards do

  @moduledoc """ 
  
    Provides methods for creating and handling a deck of cards.

  """

  @doc """ 
  
    Return a list of string with representing a deck of cards.

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"] 
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do 
      "#{value} of #{suit}"
    end

    # cards = for value <- values do # This loop return a array for each card.
    # for suit <- suits do # For every elem in that list(suits), do this thing. The default value is a array, even if return a unique value.  
    #   "#{value} of #{suit}"
    # end
    # end
    # List.flatten(cards) # This method joins each array in a unique array
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """ 

  ## Exemples 

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  
  """

  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end

  @doc """ 
  
    Divides a deck into a gand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should 
    be in the hand.

    ## Examples

        iex> deck = Cards.create_deck
        iex> { hand, deck } = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck) #binary_to_term 
    File.write(filename, binary) # { status, content } = File.read(filename) ----> arrayCards = :erlang.binary_to_term(binary)
  end

  def load(filename) do 
    { status, binary } = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end

  # How case statment works:

    # case status do
    #   {:ok, binary} = :erlang.binary_to_term(binary)
    #   {:error, _reason} = "That file does not exist" ----> A variable reason needs to exist, because the second element of a tuple are the :eno..., therefore must override this, for override, must be add a "_" at first.
    # end

  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # Do the same

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) # Deck is the first parameter of deal, but is automatily assign

  end

end
