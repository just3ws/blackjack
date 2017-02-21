# frozen_string_literal: true

module Cards
  class Pack
    def open
      Cards::Suit::SUITS.keys.flat_map do |suit|
        Cards::Rank::RANKS.keys.map do |rank|
          Card.new(rank: rank, suit: suit)
        end
      end
    end
  end
end
