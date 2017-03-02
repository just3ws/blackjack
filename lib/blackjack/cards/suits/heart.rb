# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Cards
    module Suits
      module Heart
        include Suit
        @color = :red
        @glyph = '♥'
        @name = 'Hearts'
      end
    end
  end
end
