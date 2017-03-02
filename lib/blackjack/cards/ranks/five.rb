# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Five
        include Rank
        @name = 'Five'
        @token = :'05'
      end
    end
  end
end
