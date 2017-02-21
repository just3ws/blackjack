# frozen_string_literal: true

require 'ostruct'

require_relative 'cards/rank'
require_relative 'cards/suit'
require_relative 'cards/tokens'
require_relative 'cards/turnable'

class Card
  prepend Cards::Tokenizable
  prepend Cards::Turnable

  attr_accessor :suit, :rank

  def initialize(rank:, suit:)
    @key = key

    @suit = Cards::Suit.new(suit)
    @rank = Cards::Rank.new(rank)
  end

  def for_humans
    "#{human_name} of #{suit_human_name}"
  end

  def as_graph
    {
      card: {
        token: as_token,
        suit: suit,
        name: name,
        downcard?: downcard?,
        upcard?: upcard?,
        rank: rank
      }
    }
  end
end
