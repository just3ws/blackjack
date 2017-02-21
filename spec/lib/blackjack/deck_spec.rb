# frozen_string_literal: true

RSpec.describe Deck do
  let(:one_pack) { Pack.open }

  subject { Deck.new(one_pack) }

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
