# frozen_string_literal: true

require_relative 'glyphs/suits'

module Cards
  class Suit
    NAMES ||= { spades: 'Spades',
                clubs: 'Clubs',
                hearts: 'Hearts',
                diamonds: 'Diamonds' }.freeze

    attr_reader :suit

    def initialize(suit:)
      @suit = suit.downcase.to_sym
    end

    def suit
      NAMES[suit]
    end

    def symbol
      Cards::Glyphs::SUITS[suit]
    end

    def as_graph
      {
        suit: { name: name,
                glyph: glyph }
      }
    end
  end
end
