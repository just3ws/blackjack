# frozen_string_literal: true

module Cards
  module Rank
    RANKS ||= {
      ace: { name: 'Ace', token: 'AC' },
      two: { name: 'Two', token: '02' },
      three: { name: 'Three', token: '03' },
      four: { name: 'Four', token: '04' },
      five: { name: 'Five', token: '05' },
      six: { name: 'Six', token: '06' },
      seven: { name: 'Seven', token: '07' },
      eight: { name: 'Eight', token: '08' },
      nine: { name: 'Nine', token: '09' },
      ten: { name: 'Ten', token: '10' },
      jack: { name: 'Jack', token: '10' },
      queen: { name: 'Queen', token: '10' },
      king: { name: 'King', token: '10' }
    }.freeze

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
