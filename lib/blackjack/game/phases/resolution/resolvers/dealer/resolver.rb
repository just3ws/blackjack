# frozen_string_literal: true
module Phases
  module Resolvers
    module Dealer
      class Resolver
        def initialize(dealer:, players: nil, player: nil)
          @dealer = dealer
          @players = players
          @player = player
        end

        def resolve
          raise NotImplementedError
        end
      end
    end
  end
end
