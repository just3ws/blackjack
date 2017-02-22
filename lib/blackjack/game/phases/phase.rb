# frozen_string_literal: true

module Phases
  class Phase
    attr_reader :dealer, :players

    def initialize(game:)
      @dealer = game.dealer
      @players = game.boxes
    end

    def run
      raise NotImplementedError
    end
  end
end
