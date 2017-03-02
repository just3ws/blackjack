# frozen_string_literal: true

module Blackjack
  module Cards
    module Ranks
      module Jack
        include Rank
        @name = 'Jack'
        @token = :'10'
      end
    end
  end
end
