# frozen_string_literal: true

RSpec.describe Table do
  subject(:table) { described_class.new }

  it 'has a dealer' do
    Dealer.new.tap do |dealer|
      dealer.take_ownership_of(game: table)
    end

    expect(table.dealer).to be_an_instance_of(Dealer)
  end

  context 'starting a new game' do
    context 'without players' do
      it { is_expected.to_not be_ready }
    end

    context 'player one has entered the game' do
      let(:player_one) { VirtualPlayer.new }

      it 'can let a player join the game' do
        expect do
          Dealer.new.tap do |dealer|
            dealer.take_ownership_of(game: table)
          end
          player_one.enter(game: table)
        end.to change { table.ready? }.from(false).to(true)
      end
    end
  end
end
