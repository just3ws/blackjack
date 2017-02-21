# frozen_string_literal: true

module Cards
  class Pack
    def open
      Cards::Suit::NAMES.keys.flat_map do |suit|
        Cards::Rank::NAMES.keys.map do |rank|
          Card.new(rank: rank, suit: suit)
        end
      end
    end
  end
end
