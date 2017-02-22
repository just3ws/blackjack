# frozen_string_literal: true

module Phases
  module Resolvers
    class PushResolver < Resolver
      def resolve
        # Players with point total equal to Dealer
        # convert to PUSH
        player
          .push!
      end
    end
  end
end
