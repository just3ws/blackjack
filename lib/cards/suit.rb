# frozen_string_literal: true

require_relative 'noun'

module Cards
  SUITS ||= { spades: Noun.new(singular: 'Spade', plural: 'Spades'),
              clubs: Noun.new(singular: 'Club', plural: 'Clubs'),
              hearts: Noun.new(singular: 'Heart', plural: 'Hearts'),
              diamonds: Noun.new(singular: 'Diamond', plural: 'Diamonds') }.freeze

  class Suit
    attr_reader :name

    def initialize(name)
      @name = name
    end

    # Heart (count == 1)
    # Hearts (count == 3)
    # Hearts (count == 0)
    def word(with_quantity: 1)
      Card::SUITS[name].plural if with_quantity > 1 || with_quantity == 0
      Card::SUITS[name].singular
    end

    # 1 Heart (count == 1)
    # 3 Hearts (count == 3)
    # 0 Hearts (count == 0)
    def noun(with_quantity: 1)
      "#{count} #{noun(count)}"
    end
  end
end
