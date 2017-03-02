# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Seven
        include Rank
        @name = 'Seven'
        @token = :'07'
      end
    end
  end
end
