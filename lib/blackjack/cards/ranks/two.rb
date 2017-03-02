# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Two
        include Rank
        @name = 'Two'
        @token = :'02'
      end
    end
  end
end
