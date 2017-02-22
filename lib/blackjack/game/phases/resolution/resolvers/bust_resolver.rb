# frozen_string_literal: true

module Phases
  module Resolvers
    class BustResolver < Resolver
      def resolve
        # If player hasn't already won then convert to win by dealer bust
        players
          .select(&:unknown?)
          .each(&:dealer_bust!)
      end
    end
  end
end
