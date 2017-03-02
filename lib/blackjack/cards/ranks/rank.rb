# frozen_string_literal: true

module Blackjack
  module Cards
    module Ranks
      module Rank
        attr_reader :name, :token

        def as_graph
          {
            rank: {
              name: name,
              token: token
            }
          }
        end
      end
    end
  end
end
