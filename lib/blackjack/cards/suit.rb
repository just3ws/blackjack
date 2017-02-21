# frozen_string_literal: true

module Cards
  class Suit
    attr_reader :key

    def initialize(key:)
      @key = key.downcase.to_sym
    end

    def name
      SUITS[key][:name]
    end

    def glyph
      SUITS[key][:glyph]
    end

    def color
      SUITS[key][:color]
    end

    def as_graph
      {
        suit: {
          key: key,
          name: name,
          glyph: glyph
        }
      }
    end
  end
end
