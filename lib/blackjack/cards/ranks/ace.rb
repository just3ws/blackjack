# frozen_string_literal: true

module Blackjack
  module Cards
    module Ranks
      module Ace
        include Rank
        @name = 'Ace'
        @token = :AC
      end
    end
  end
end
