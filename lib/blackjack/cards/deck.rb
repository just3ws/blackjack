# frozen_string_literal: true

class Deck
  attr_accessor :cards

  def initialize(cards = [])
    @cards = cards
  end

  def draw
    @cards.delete_at(rand(@cards.count))
  end

  def as_graph
    {
      deck: {
        cards: {
          count: @cards.count
        }
      }
    }
  end
end
