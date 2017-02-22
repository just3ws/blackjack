# frozen_string_literal: true

module Phases
  module Resolvers
    module Dealer
      class LowHand < Resolution
        def resolve
          player.high_hand!
        end
      end
    end
  end
end
