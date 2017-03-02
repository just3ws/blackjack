# encoding: utf-8
# frozen_string_literal: true

require_relative 'suit'

module Blackjack
  module Cards
    module Suits
      module Diamond
        include Suit

        @color = :red
        @glyph = '♦'
        @name = 'Diamonds'
      end
    end
  end
end
