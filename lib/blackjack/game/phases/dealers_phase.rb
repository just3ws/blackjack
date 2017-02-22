# frozen_string_literal: true

module Phases
  class DealersPhase
    include States::DecisionState

    attr_accessor :game

    def initialize(game:)
      @game = game
    end

    def run
      deal_an_upcard_to_the_dealer

      22.times do |turn_guard|
        raise 'INCONCEIVABLE!' if turn_guard >= 21

        deal_an_upcard_to_the_dealer if game.dealer.hit?

        game.dealer.bust! if game.dealer.hand.bust?
        game.dealer.blackjack! if game.dealer.hand.blackjack?
        game.dealer.twenty_one! if game.dealer.hand.twenty_one?

        next unless game.dealer.done?

        break
      end
    end

    def deal_an_upcard_to_the_dealer
      game.dealer.deal_upcard_to(game.dealer)
    end
  end
end
