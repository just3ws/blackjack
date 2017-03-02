# frozen_string_literal: true

require_relative 'cards/ranks'
require_relative 'cards/suits'
require_relative 'cards/card'

module Blackjack
  module Cards
    def self.open
      # Blackjack::Cards::SUITS.keys.flat_map do |suit|
      # Blackjack::Cards::RANKS.keys.map do |rank|
      # Blackjack::Cards::Card.new(rank: rank, suit: suit)
      # end
      # end
    end
  end
end
