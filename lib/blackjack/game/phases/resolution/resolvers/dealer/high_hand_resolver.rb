# frozen_string_literal: true
module Phases
  module Resolvers
    module Dealer
      class HighHandResolver < Resolver
        def resolve
          player.low_hand!
        end
      end
    end
  end
end
