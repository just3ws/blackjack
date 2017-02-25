# frozen_string_literal: true

require_relative 'rank'
require_relative 'suit'

module Blackjack
  module Cards
    class Card
      attr_accessor :suit, :rank

      def initialize(rank:, suit:, downcard: true)
        @rank = if rank.instance_of?(Blackjack::Cards::Rank)
                  rank
                else
                  Blackjack::Cards::Rank.new(rank: rank)
                end

        @suit = if suit.instance_of?(Blackjack::Cards::Suit)
                  suit
                else
                  Blackjack::Cards::Suit.new(name: suit)
                end

        @downcard = downcard
      end

      def name
        "#{rank.name} of #{suit.name}"
      end

      def upcard!
        @downcard = false

        self
      end

      def upcard?
        !@downcard
      end

      def downcard?
        @downcard
      end

      def as_graph
        {
          card: {
            name: name,
            glyph: glyph,
            downcard?: downcard?,
            upcard?: upcard?
          }.merge(rank.as_graph).merge(suit.as_graph)
        }
      end
    end
  end
end
