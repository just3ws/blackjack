# frozen_string_literal: true

module Phases
  module Dealer
    class ResolutionPhase
      attr_reader :game

      def initialize(game:)
        @game = game
      end

      def run
        if game.dealer.hand.bust?
          Dealer::BustResolver
        elsif game.dealer.hand.blackjack?
          Dealer::BlackjackResolver
        else
          Dealer::ShowdownResolver
        end.new(dealer: game.dealer, players: game.boxes).resolve
      end
    end
  end
end
