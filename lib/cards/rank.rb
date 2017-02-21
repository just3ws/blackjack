# frozen_string_literal: true

module Cards
  module Rank
    attr_reader:key

    def initialize(key:)
      @key = key.downcase.to_sym
    end

    def name
      RANKS[key][:name]
    end

    def token
      RANKS[key][:token]
    end

    def as_graph
      {
        rank: {
          key: key,
          name: name,
          token: token
        }
      }
    end
  end
end
