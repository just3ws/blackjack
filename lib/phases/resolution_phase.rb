# frozen_string_literal: true

module Phases
  class ResolutionPhase
    attr_accessor :game
    attr_reader :board

    WON = 'won'
    LOST = 'lost'
    TIED = 'tied'
    UNKNOWN = 'Unknown final play state'

    def initialize(game:)
      @game = game
      @board = {
        dealer: game.dealer,
        won: [],
        lost: [],
        unknown: [],
        tied: []
      }
    end

    def dealer_bust?
      game.dealer.hand.bust?
    end

    def dealer_blackjack?
      game.dealer.hand.blackjack?
    end

    def run
      Blackjack.logger.info { '*' * 80 }

      if dealer_bust?
        Blackjack.logger.debug("Dealer BUST holding #{game.dealer.hand.description}")

        # If player hasn't already won then convert to win by dealer bust
        game.boxes.select(&:unknown?).each(&:dealer_bust!)
      elsif dealer_blackjack?
        Blackjack.logger.debug("Dealer BLACKJACK holding #{game.dealer.hand.description}")

        # NOTE: "Blackjack" is an exactly 2 card twenty-one and beats a >2 twenty-one.

        # If player hasn't already won then convert to loss by dealer blackjack
        game.boxes.reject { |player| player.hand.blackjack? }.each(&:dealer_blackjack!)

        # If player has blackjack as well then they are converted to push
        game.boxes.select { |player| player.hand.blackjack? }.each(&:push!)
      else
        Blackjack.logger.debug("Dealer SHOWDOWN holding #{game.dealer.hand.description}")

        # Dealer showdown
        remaining_players = game.boxes.reject do |player|
          player.lost? || player.hand.blackjack?
        end

        remaining_players.each do |player|
          if player.hand.point_total > game.dealer.hand.point_total
            player.high_hand!
          elsif player.hand.point_total == game.dealer.hand.point_total
            player.push!
          else
            player.low_hand!
          end
        end
      end

      Blackjack.logger.debug('-' * 80)

      game.boxes.each_with_index do |player, i|
        i += 1

        final = if player.won?
                  WON
                elsif player.lost?
                  LOST
                elsif player.tie?
                  TIED
                else
                  raise UNKNOWN
                end

        Blackjack.logger.debug("#{player.name} #{final} by #{player.play_state.to_s.sub(/_/, ' ')} with #{player.hand.description}")
      end

      Blackjack.logger.info { '*' * 80 }
    end
  end
end
