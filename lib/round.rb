# frozen_string_literal: true

class Round
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    Blackjack.logger.info { "\nBeginning game with #{game.boxes.count} player(s)\n" }

    Phases::PlayersPhase.new(game: game).run
    Phases::DealersPhase.new(game: game).run
    Phases::ResolutionPhase.new(game: game).run

    Blackjack.logger.info { "\nEnd of game with #{game.boxes.count} player(s)\n" }
  end
end
