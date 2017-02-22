# frozen_string_literal: true

module Phases
  module Dealer
    class DealerPhase < Phase
      def run
        deal_an_upcard_to_the_dealer

        22.times do |turn_guard|
          raise 'INCONCEIVABLE!' if turn_guard >= 21

          deal_an_upcard_to_the_dealer if dealer.hit?

          dealer.bust! if dealer.hand.bust?
          dealer.blackjack! if dealer.hand.blackjack?
          dealer.twenty_one! if dealer.hand.twenty_one?

          next unless dealer.done?
        end
      end

      protected

      def deal_an_upcard_to_the_dealer
        dealer.deal_upcard_to(dealer)
      end
    end
  end
end
