# frozen_string_literal: true

module Phases
  module Resolvers
    class BlackjackResolver < Resolver
      def resolve
        # NOTE: "Blackjack" - Is two card twenty-one: (10|Jack|Queen|King) + Ace
        #                   - Beats a >= 3 card twenty-one.

        convert_players_without_blackjack_to_loss
        convert_players_with_blackjack_to_push
      end

      def convert_players_without_blackjack_to_loss
        # Players who have NOT already won by Blackjack
        # convert to LOSE by Dealer Blackjack
        players
          .reject { |player| player.hand.blackjack? }
          .each(&:dealer_blackjack!)
      end

      def convert_players_with_blackjack_to_push
        # Players with Blackjack
        # convert to PUSH
        players
          .select { |player| player.hand.blackjack? }
          .each(&:push!)
      end
    end
  end
end
