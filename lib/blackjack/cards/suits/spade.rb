# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Cards
    module Suits
      module Spade
        include Suit
        @color = :black
        @glyph = '♠'
        @name = 'Spades'
      end
    end
  end
end
