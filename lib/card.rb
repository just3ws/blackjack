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
    @rank = Cards::Rank.new(rank)
    @suit = Cards::Suit.new(suit)
  end

  def for_humans
    "#{human_name} of #{suit_human_name}"
  end

  def as_graph
    {
      card: {
        downcard?: downcard?,
        upcard?: upcard?
      }.merge(rank.as_graph).merge(suit.as_graph)
    }
  end
end
