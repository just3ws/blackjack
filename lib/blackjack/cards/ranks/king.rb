# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module King
        include Rank
        @name = 'King'
        @token = :'10'
      end
    end
  end
end
