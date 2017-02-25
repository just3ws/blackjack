# frozen_string_literal: true

module Blackjack
  module Cards
    class Rank
      def initialize(rank:)
        @rank = rank.downcase.to_sym
      end

      def name
        RANKS[@rank][:name]
      end

      def token
        RANKS[@name][:token]
      end

      def as_graph
        {
          rank: {
            name: name,
            token: token
          }
        }
      end
    end
  end
end
