# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Six
        include Rank
        @name = 'Six'
        @token = :'06'
      end
    end
  end
end
