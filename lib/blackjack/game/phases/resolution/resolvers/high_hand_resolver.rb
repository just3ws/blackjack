# frozen_string_literal: true

module Phases
  module Resolvers
    class HighHandResolver < Resolver
      def resolve
        # Players with point total less than Dealer
        # convert to LOSE by Low Hand.
        player
          .low_hand!
      end
    end
  end
end
