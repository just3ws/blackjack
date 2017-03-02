# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Eight
        include Rank
        @name = 'Eight'
        @token = :'08'
      end
    end
  end
end
