# frozen_string_literal: true

module Cards
  class Noun
    attr_reader :singular, :plural

    def initialize(singular:, plural:)
      @singular = singular
      @plural = plural
    end

    # Six (count == 1)
    # Sixes (count == 3)
    # Sixes (count == 0)
    def plural(with_quantity: 1)
      Card::RANKS[name].plural if with_quantity > 1 || with_quantity == 0
      Card::RANKS[name].singular
    end

    # 1 Six (count == 1)
    # 3 Sixes (count == 3)
    # 0 Sixes (count == 0)
    def word(with_quantity: 1)
      "#{count} #{noun(count)}"
    end
  end
end
