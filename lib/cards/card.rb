# frozen_string_literal: true

require 'ostruct'

require_relative 'rank'
require_relative 'suit'
require_relative 'glyphs/cards'

module Cards
  class Card
    attr_accessor :suit, :rank

    def initialize(rank:, suit:, downcard: true)
      @rank = Cards::Rank.new(key: rank)
      @suit = Cards::Suit.new(key: suit)

      @downcard = downcard
    end

    def name
      "#{rank.name} of #{suit.name}"
    end

    def glyph
      Cards::Glyphs::CARDS[key]
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