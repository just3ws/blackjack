# frozen_string_literal: true

module Cards
  module Pack
    def self.open
      Cards::Suit::SUITS.keys.flat_map do |suit|
        Cards::Rank::RANKS.keys.map do |rank|
          Card.new(rank: rank, suit: suit)
        end
      end
    end
  end
end
