# frozen_string_literal: true

class Round
  attr_accessor :game

  def initialize(game:)
    @game = game
  end

  def run
    Phases::PlayersPhase.new(game: game).run
    Phases::DealerPhase.new(game: game).run
    Phases::ResolutionPhase.new(game: game).run
  end
end
