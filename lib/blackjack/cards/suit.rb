# frozen_string_literal: true

module Blackjack
  module Cards
    class Suit
      attr_reader :name

      def initialize(name:)
        @name = name.downcase.to_sym
      end

      def name
        SUITS[name][:name]
      end

      def glyph
        SUITS[name][:glyph]
      end

      def color
        SUITS[name][:color]
      end

      def as_graph
        {
          suit: {
            name: name,
            name: name,
            glyph: glyph
          }
        }
      end
    end
  end
end
