# frozen_string_literal: true

require 'colorize'

module Cards
  class Suit
    attr_reader :key

    def initialize(key:)
      @key = key.downcase.to_sym
    end

    def name
      SUITS[key][:name]
    end

    def glyph(colorize: false)
      SUITS[key][:glyph].colorize(color: color, background: :white) if colorize
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
