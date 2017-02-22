# frozen_string_literal: true

module Phases
  module Resolvers
    class LowHand < Resolution
      def resolve
        # Players with point total greater than Dealer
        # convert to WIN by High Hand
        player
          .high_hand!
      end
    end
  end
end
