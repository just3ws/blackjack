# frozen_string_literal: true

require_relative 'token'
require 'forwardable'

module Cards
  module Rank
    extend Forwardable

    NAMES ||= { ace: 'Ace',
                two: 'Two',
                three: 'Three',
                four: 'Four',
                five: 'Five',
                six: 'Six',
                seven: 'Seven',
                eight: 'Eight',
                nine: 'Nine',
                ten: 'Ten',
                jack: 'Jack',
                queen: 'Queen',
                king: 'King' }.freeze

    attr_reader :key

    def initialize(key:)
      @key = key.downcase.to_sym
      @token = Cards::Token.new(key: key)
    end

    def name
      NAMES[key]
    end

    def_delegators :@token, :token

    def as_graph
      { rank: { key: key,
                name: name }.merge(token.as_graph.dig(:token, :value)) }
    end
  end
end
