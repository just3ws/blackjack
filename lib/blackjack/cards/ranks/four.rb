# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Four
        include Rank
        @name = 'Four'
        @token = :'04'
      end
    end
  end
end
