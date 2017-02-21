# frozen_string_literal: true
module Cards
  module Turnable
    @downcard = true

    def upcard!
      @downcard = false

      self
    end

    def downcard!
      @downcard = true

      self
    end

    def upcard?
      !@downcard
    end

    def downcard?
      @downcard ||= true
    end
  end
end
