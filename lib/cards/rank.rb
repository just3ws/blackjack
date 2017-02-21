# frozen_string_literal: true

require_relative 'noun'

module Cards
  RANKS ||= { ace: Noun.new(singular: 'Ace', plural: 'Aces'),
              ten: Noun.new(singular: 'Ten', plural: 'Tens'),
              jack: Noun.new(singular: 'Jack', plural: 'Jacks'),
              queen: Noun.new(singular: 'Queen', plural: 'Queens'),
              king: Noun.new(singular: 'King', plural: 'Kings'),
              nine: Noun.new(singular: 'Nine', plural: 'Nines'),
              eight: Noun.new(singular: 'Eight', plural: 'Eights'),
              seven: Noun.new(singular: 'Seven', plural: 'Sevens'),
              six: Noun.new(singular: 'Six', plural: 'Sixes'),
              five: Noun.new(singular: 'Five', plural: 'Fives'),
              four: Noun.new(singular: 'Four', plural: 'Fours'),
              three: Noun.new(singular: 'Three', plural: 'Threes'),
              two: Noun.new(singular: 'Two', plural: 'Twos') }.freeze

  module Rank
    attr_reader :name

    def initialize(name)
      @name = name
    end
  end
end
