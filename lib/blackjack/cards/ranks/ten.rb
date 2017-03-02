# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Ten
        include Rank
        @name = 'Ten'
        @token = :'10'
      end
    end
  end
end
