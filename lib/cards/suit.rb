# encoding: utf-8
# frozen_string_literal: true

module Cards
  class Suit
    SUITS ||= {
      spades: {
        name: 'Spades',
        glyph: '♠'
      },
      clubs:    {
        name:  'Clubs',
        glyph: '♣'
      },
      hearts:   {
        name:  'Hearts',
        glyph: '♥'
      },
      diamonds: {
        name: 'Diamonds',
        glyph: '♦'
      }
    }.freeze

    attr_reader :key

    def initialize(key:)
      @key = key.downcase.to_sym
    end

    def name
      NAMES[key][:name]
    end

    def glyph
      NAMES[key][:glyph]
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
