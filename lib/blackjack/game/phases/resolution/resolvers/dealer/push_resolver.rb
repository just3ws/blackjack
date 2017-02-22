
# frozen_string_literal: true
module Phases
  module Resolvers
    module Dealer
      class PushResolver < Resolver
        def resolve
          player.push!
        end
      end
    end
  end
end
