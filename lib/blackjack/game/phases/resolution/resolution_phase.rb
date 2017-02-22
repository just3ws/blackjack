# frozen_string_literal: true

module Phases
  module Dealer
    class ResolutionPhase < Phase
      def run
        if dealer.hand.bust?
          Dealer::BustResolver
        elsif dealer.hand.blackjack?
          Dealer::BlackjackResolver
        else
          Dealer::ShowdownResolver
        end.new(dealer: dealer, players: players).resolve
      end
    end
  end
end
