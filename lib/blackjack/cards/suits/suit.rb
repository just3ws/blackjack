# frozen_string_literal: true

module Blackjack
  module Cards
    module Suits
      module Suit
        attr_reader :color, :glyph, :name

        def as_graph
          {
            suit: {
              name: name,
              glyph: glyph,
              color: color
            }
          }
        end
      end
    end
  end
end
