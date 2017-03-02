# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Queen
        include Rank
        @name = 'Queen'
        @token = :'10'
      end
    end
  end
end
