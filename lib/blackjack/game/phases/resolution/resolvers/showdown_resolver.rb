# frozen_string_literal: true

module Phases
  module Resolvers
    class ShowdownResolver < Resolver
      def resolve
        # Compare the dealer's hand with the remaining players
        remaining_players = players.reject do |player|
          player.lost? || player.hand.blackjack?
        end

        remaining_players.each do |player|
          if dealer_low_hand_versus?(player: player)
            Dealer::LowHand
          elsif dealer_push_versus?(player: player)
            Dealer::Push
          elsif dealer_high_hand_versus?(player: player)
            Dealer::HighHand
          end.new(dealer: dealer, player: player).resolve
        end
      end

      def dealer_high_hand_versus?(player:)
        dealer.hand.point_total > player.hand.point_total
      end

      def dealer_push_versus?(player:)
        dealer.hand.point_total == player.hand.point_total
      end

      def dealer_low_hand_versus?(player:)
        dealer.hand.point_total < player.hand.point_total
      end
    end
  end
end
