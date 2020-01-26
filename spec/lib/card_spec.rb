# frozen_string_literal: true

RSpec.describe Card do
  subject(:card) do
    Card.new(
      suit: :hearts,
      name: :ten,
      rank: 10
    )
  end

  it 'has the correct suit' do
    expect(card.suit).to eq(:hearts)
  end

  it 'has the correct name' do
    expect(card.name).to eq(:ten)
  end

  it 'has the correct rank' do
    expect(card.rank).to eq(10)
  end

  it { is_expected.to_not be_upcard }
  it { is_expected.to be_downcard }

  describe '#upcard!' do
    it 'it is now an upcard' do
      expect { card.upcard! }.to change { card.upcard? }.from(false).to(true)
    end

    it 'it is not a downcard' do
      expect { card.upcard! }.to change { card.downcard? }.from(true).to(false)
    end
  end
end
