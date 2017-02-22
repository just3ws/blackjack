# frozen_string_literal: true

module States
  module DecisionState
    attr_accessor :decisions

    UNKNOWN_DECISION_STATE = :unknown
    HIT = :hit
    STAND = :stand
    DECISION_STATES = [HIT, STAND].freeze

    def set_initial_decisions_state!
      @decision_state = UNKNOWN_DECISION_STATE
      @decisions = []
    end

    # Decisons
    def hit!
      @decision_state = HIT
    end

    def hit?
      @decision_state.equal?(HIT)
    end

    def stand?
      @decision_state.equal?(STAND)
    end

    def stand!
      done!

      @decision_state = STAND
    end

    def remember(decision)
      @decisions.push({
        decision: decision, done?: done?
      }.merge(hand.as_graph))

      decision
    end
  end
end
