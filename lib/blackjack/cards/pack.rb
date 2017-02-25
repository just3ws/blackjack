# frozen_string_literal: true

require_relative 'ranks'
require_relative 'suits'
require_relative 'card'

module Blackjack
  module Cards
    module Pack
      def self.open
        Blackjack::Cards::SUITS.keys.flat_map do |suit|
          Blackjack::Cards::RANKS.keys.map do |rank|
            Blackjack::Cards::Card.new(rank: rank, suit: suit)
          end
        end
      end
    end
  end
end
