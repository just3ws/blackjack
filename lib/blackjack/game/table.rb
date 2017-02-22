# frozen_string_literal: true

class Table
  attr_reader :dealer, :players

  def initialize(dealer: nil)
    @dealer = dealer
    @players = []
  end

  def play
    raise 'Game is not ready to start' unless ready?

    dealer.prepare_for_game

    Round.new(game: self).run
  end

  def accept(player:)
    raise 'No dealer to accept player' unless dealer?

    players << player
  end

  def ready?
    dealer? && players?
  end

  def dealer?
    dealer.instance_of?(Dealer)
  end

  def players?
    players.any? && players.all? { |player| player.is_a?(Player) }
  end

  def as_graph
    {
      table: {
        boxes: players.map(&:as_graph)
      }.merge(dealer.as_graph)
    }
  end
end
