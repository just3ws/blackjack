# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Cards
    module Suits
      module Club
        include Suit
        @color = :black
        @glyph = '♣'
        @name = 'Clubs'
      end
    end
  end
end
