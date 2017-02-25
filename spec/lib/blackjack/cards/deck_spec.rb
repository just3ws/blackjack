# frozen_string_literal: true

require_relative '../../../../lib/blackjack/cards/pack'
require_relative '../../../../lib/blackjack/cards/deck'

module Blackjack
  module Cards
    RSpec.describe Deck do
      let(:one_pack) { Blackjack::Cards::Pack.open }

      subject { Blackjack::Cards::Deck.new(one_pack) }

      it 'starts with 52 cards' do
        actual = subject.cards.count
        expected = 52

        expect(actual).to be(expected)
      end

      describe '#draw' do
        it 'decrements the playable card count by one' do
          expect do
            subject.send(:draw)
          end.to change { subject.cards.count }.from(52).to(51)
        end
      end
    end
  end
end
