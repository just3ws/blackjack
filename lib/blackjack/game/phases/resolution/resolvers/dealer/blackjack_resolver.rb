# frozen_string_literal: true
module Phases
  module Resolvers
    module Dealer
      class BlackjackResolver < Resolver
        def resolve
          # NOTE: "Blackjack" is an exactly 2 card twenty-one and beats a >2 twenty-one.

          # If player hasn't already won then convert to loss by dealer blackjack
          players.reject { |player| player.hand.blackjack? }.each(&:dealer_blackjack!)

          # If player has blackjack as well then they are converted to push
          players.select { |player| player.hand.blackjack? }.each(&:push!)
        end
      end
    end
  end
end
