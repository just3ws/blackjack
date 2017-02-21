# frozen_string_literal: true

require_relative 'glyphs/suits'

module Cards
  class Suit
    NAMES ||= { spades: 'Spades',
                clubs: 'Clubs',
                hearts: 'Hearts',
                diamonds: 'Diamonds' }.freeze

    attr_reader :key

    def initialize(key:)
      @key = key.downcase.to_sym
    end

    def name
      NAMES[key]
    end

    def glyph
      Cards::Glyphs::SUITS[key]
    end

    def as_graph
      {
        suit: { name: name,
                glyph: glyph }
      }
    end
  end
end
