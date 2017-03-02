# frozen_string_literal: true

require_relative 'rank'

module Blackjack
  module Cards
    module Ranks
      module Nine
        include Rank

        @name = 'Nine'
        @token = :'09'
      end
    end
  end
end
