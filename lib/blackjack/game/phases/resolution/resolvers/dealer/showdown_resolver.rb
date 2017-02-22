# frozen_string_literal: true
module Phases
  module Resolvers
    module Dealer
      class ShowdownResolver < Resolver
        def resolve
          # Compare the dealer's hand with the remaining players
          remaining_players = players.reject do |player|
            player.lost? || player.hand.blackjack?
          end

          remaining_players.each do |player|
            if low_hand?(versus: player)
              Dealer::LowHand
            elsif push?(versus: player)
              Dealer::Push
            elsif high_hand?(versus: player)
              Dealer::HighHand
            end.new(dealer: dealer, player: player).resolve
          end
        end

        def high_hand?(versus:)
          dealer.hand.point_total > versus.hand.point_total
        end

        def push?(versus:)
          dealer.hand.point_total == versus.hand.point_total
        end

        def low_hand?(versus:)
          dealer.hand.point_total < versus.hand.point_total
        end
      end
    end
  end
end
