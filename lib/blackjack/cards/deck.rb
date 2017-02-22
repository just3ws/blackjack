# frozen_string_literal: true

module Blackjack
  module Cards
    class Deck
      attr_reader :cards

      def initialize(cards = [])
        @cards = cards
      end

      def draw
        cards.delete_at(rand(@cards.count))
      end

      def as_graph
        {
          deck: {
            cards: {
              count: cards.count
            }
          }
        }
      end
    end
  end
end
