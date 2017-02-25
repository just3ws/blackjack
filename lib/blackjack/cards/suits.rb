# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Cards
    module Suits
      module Spades
        attr_reader :color
        @color = :black
      end

      module Clubs
        attr_reader :color
        @color = :black
      end

      module Hearts
        attr_reader :color
        @color = :red
      end

      module Diamonds
        attr_reader :color
        @color = :red
      end
    end

    SUITS = {
      spades: {
        name: 'Spades',
        glyph: '♠',
        color: :black
      },
      clubs:    {
        name:  'Clubs',
        glyph: '♣',
        color: :black
      },
      hearts:   {
        name:  'Hearts',
        glyph: '♥',
        color: :red
      },
      diamonds: {
        name: 'Diamonds',
        glyph: '♦',
        color: :red
      }
    }.freeze
  end
end
