# frozen_string_literal: true

require_relative '../../../../lib/blackjack/cards/card'

module Blackjack
  module Cards
    RSpec.describe Card do
      subject do
        Blackjack::Cards::Card.new(
          suit: :hearts,
          rank: :ten
        )
      end

      #   xit 'has the correct suit' do
      #     expect(subject.suit).to eq(:hearts)
      #   end

      #   xit 'has the correct name' do
      #     expect(subject.name).to eq(:ten)
      #   end

      #   xit 'has the correct rank' do
      #     expect(subject.rank).to eq(10)
      #   end

      #   xit 'starts face down' do
      #     expect(subject).to_not be_upcard
      #     expect(subject).to be_downcard
      #   end

      #   describe '#upcard!' do
      #     xit 'it is now an upcard' do
      #       expect { subject.upcard! }.to change { subject.upcard? }.from(false).to(true)
      #     end

      #     xit 'it is not a downcard' do
      #       expect { subject.upcard! }.to change { subject.downcard? }.from(true).to(false)
      #     end
      #   end
    end
  end
end
