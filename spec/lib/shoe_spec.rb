# frozen_string_literal: true

RSpec.describe Shoe do
  let(:one_deck) { Deck.new.open }

  subject(:shoe) { Shoe.new(one_deck) }

  it 'starts with 52 cards' do
    actual = shoe.cards.count
    expected = 52

    expect(actual).to be(expected)
  end

  describe '#draw' do
    it 'decrements the playable card count by one' do
      expect do
        shoe.send(:draw)
      end.to change { shoe.cards.count }.from(52).to(51)
    end
  end
end
