# frozen_string_literal: true

class Table
  attr_accessor :boxes, :dealer, :deck

  def initialize(dealer: nil)
    @dealer = dealer
    @deck = Deck.new
    @boxes = []
  end

  def run
    raise 'Game is not ready to start' unless ready?

    @dealer.prepare_for_game

    Round.new(game: self).run
  end

  def accept(player:)
    raise 'No dealer to accept player' unless dealer?

    @boxes << player
  end

  def ready?
    dealer? && players?
  end

  def dealer?
    @dealer.instance_of?(Dealer)
  end

  def players?
    @boxes.any? && @boxes.all? { |box| box.is_a?(Player) }
  end

  def as_graph
    {
      table: {
        boxes: boxes.map(&:as_graph)
      }
        .merge(dealer.as_graph)
        .merge(deck.as_graph)
    }
  end
end
