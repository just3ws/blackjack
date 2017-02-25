# frozen_string_literal: true

require_relative '../../../../lib/blackjack/cards/pack'

module Blackjack
  module Cards
    RSpec.describe Pack do
      it 'has 52 cards' do
        expect(subject.open.count).to eq(52)
      end
    end
  end
end
