# frozen_string_literal: true

require 'ostruct'

require_relative 'cards/rank'
require_relative 'cards/suit'
require_relative 'cards/glyphs/cards'
require_relative 'cards/turnable'

class Card
  prepend Cards::Turnable

  attr_accessor :suit, :rank

  def initialize(rank:, suit:)
    @rank = Cards::Rank.new(key: rank)
    @suit = Cards::Suit.new(key: suit)
  end

  def name
    "#{rank.name} of #{suit.name}"
  end

  def glyph
    Cards::Glyphs::CARDS[key]
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
