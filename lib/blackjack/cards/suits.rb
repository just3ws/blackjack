# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Cards
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
