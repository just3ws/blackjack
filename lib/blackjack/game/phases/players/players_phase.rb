# frozen_string_literal: true

module Phases
  module Players
    class PlayersPhase < Phase
      def run
        deal_an_upcard_to_each_player
        deal_an_upcard_to_the_dealer
        deal_an_upcard_to_each_player

        players.each do |player|
          22.times do |turn_guard|
            raise 'INCONCEIVABLE!' if turn_guard >= 21

            deal_upcard_to(player) if player.hit?

            player.bust! if player.hand.bust?
            player.blackjack!  if player.hand.blackjack?
            player.twenty_one! if player.hand.twenty_one?

            next unless player.done?

            break
          end
        end
      end

      protected

      def deal_an_upcard_to_each_player
        players.each do |player|
          deal_upcard_to(player)
        end
      end

      def deal_upcard_to(player)
        dealer.deal_upcard_to(player)
      end

      def deal_an_upcard_to_the_dealer
        dealer.deal_upcard_to(dealer)
      end
    end
  end
end
