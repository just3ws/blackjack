# frozen_string_literal: true

module Cards
  TOKENS = { ace: 'AC',
             ten: '10',
             jack:  '10',
             queen: '10',
             king: '10',
             nine: '09',
             eight: '08',
             seven: '07',
             six: '06',
             five: '05',
             four: '04',
             three: '03',
             two: '02' }.freeze

  module Tokenizable
    def as_token
      Card::TOKENS[@rank]
    end
  end
end
