# frozen_string_literal: true

module Cards
  class Token
    attr_reader :key

    def initialize(key:)
      @key = key
    end

    def value
      TOKENS[key]
    end

    def as_graph
      { token: { key: key,
                 value: token } }
    end

    TOKENS = { ace: 'AC',
               two: '02',
               three: '03',
               four: '04',
               five: '05',
               six: '06',
               seven: '07',
               eight: '08',
               nine: '09',
               ten: '10',
               jack:  '10',
               queen: '10',
               king: '10' }.freeze
  end
end
