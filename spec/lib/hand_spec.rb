# frozen_string_literal: true

RSpec.describe Hand do
  subject(:hand) { described_class.new }

  it 'starts with no cards' do
    expect(hand.cards).to be_empty
  end

  describe '#pair?' do
    it 'two aces' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(subject).to be_pair
    end

    it 'a facecard and a ten are actually pairs' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :ten, rank: 10)

      expect(subject).to be_pair
    end

    it 'three cards are not a pair though' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :four, rank: 4)

      expect(subject).to_not be_pair
    end

    it 'two different cards are not a pair' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :four, rank: 4)

      expect(subject).to_not be_pair
    end
  end

  describe '#hard?' do
    it 'thirteen total forces ace to hard' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :three, rank: 3)
      hand.cards << Card.new(name: :ten, rank: 10)

      expect(subject).to be_hard
      expect(subject).to_not be_soft
    end

    it 'fifteen total forces ace to hard' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :six, rank: 6)
      hand.cards << Card.new(name: :nine, rank: 9)

      expect(subject).to be_hard
      expect(subject).to_not be_soft
    end

    it 'treats blackjack as soft' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ten, rank: 10)

      expect(subject).to be_soft
      expect(subject).to_not be_hard
      expect(subject).to be_blackjack
    end

    it 'ten with four aces has forces all aces hard' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ten, rank: 10)

      expect(subject).to be_hard
      expect(subject).to_not be_soft
    end
  end

  describe '#soft?' do
    it 'three total has room for soft ace' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :three, rank: 3)

      expect(subject).to be_soft
      expect(subject).to_not be_hard
    end

    it 'two with four aces has room for a soft ace' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :two, rank: 2)

      expect(subject).to be_soft
      expect(subject).to_not be_hard
    end
  end

  describe '#hard_count' do
    it 'treats aces as one' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(hand.hard_count).to eq(2)
    end

    it 'treats calculates normal card with ace' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ten, rank: 10)

      expect(hand.hard_count).to eq(11)
    end

    it 'totals hands without aces' do
      hand.cards << Card.new(name: :two, rank: 2)
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :nine, rank: 9)

      expect(hand.hard_count).to eq(21)
    end
  end

  describe '#twenty_one?' do
    it 'is blackjack' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(subject).to be_blackjack
    end

    it 'king+king+ace is ten+ten+one' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(subject).to be_twenty_one
    end

    it 'nine+ace+ace equals nine+one+eleven' do
      hand.cards << Card.new(name: :nine, rank: 9)
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(subject).to be_twenty_one
    end

    it 'five+six equals eleven so not blackjack' do
      hand.cards << Card.new(name: :five, rank: 5)
      hand.cards << Card.new(name: :six, rank: 6)

      expect(subject).to_not be_blackjack
    end

    it 'three+two+nine+seven is twenty_one' do
      hand.cards << Card.new(name: :three, rank: 3)
      hand.cards << Card.new(name: :two, rank: 2)
      hand.cards << Card.new(name: :nine, rank: 9)
      hand.cards << Card.new(name: :seven, rank: 7)

      expect(subject).to be_twenty_one
    end
  end

  describe '#point_total' do
    it 'has no aces' do
      hand.cards << Card.new(name: :eight, rank: 8)
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :two, rank: 2)

      expect(hand.point_total).to eq(20)
    end

    it 'is two aces' do
      hand.cards << Card.new(name: :ace, rank: [1, 11])
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(hand.point_total).to eq(12)
    end

    it 'has one ace' do
      hand.cards << Card.new(name: :eight, rank: 8)
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(hand.point_total).to eq(19)
    end

    it 'is blackjack' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :ace, rank: [1, 11])

      expect(hand.point_total).to eq(21)
    end

    it 'is bust' do
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :king, rank: 10)
      hand.cards << Card.new(name: :king, rank: 10)

      expect(hand.point_total).to eq(30)
    end
  end

  describe '#bust?' do
    context 'hard hand' do
      it 'ten+king+two is bust' do
        hand.cards << Card.new(name: :ten, rank: 10)
        hand.cards << Card.new(name: :king, rank: 10)
        hand.cards << Card.new(name: :two, rank: 2)

        expect(subject).to be_bust
      end

      it 'queen+two+five+five is bust' do
        hand.cards << Card.new(name: :queen, rank: 10)
        hand.cards << Card.new(name: :two, rank: 2)
        hand.cards << Card.new(name: :five, rank: 5)
        hand.cards << Card.new(name: :five, rank: 5)

        expect(subject).to be_bust
      end
    end

    context 'soft hand' do
      it 'ten+king+ace is not bust' do
        hand.cards << Card.new(name: :ten, rank: 10)
        hand.cards << Card.new(name: :king, rank: 10)
        hand.cards << Card.new(name: :ace, rank: [1, 11])

        expect(subject).to_not be_bust
      end

      it 'ace+six+ten is not bust' do
        hand.cards << Card.new(name: :ten, rank: 10)
        hand.cards << Card.new(name: :six, rank: 6)
        hand.cards << Card.new(name: :ace, rank: [1, 11])

        expect(subject).to_not be_bust
      end

      it 'ace+ace+ace is not bust' do
        hand.cards << Card.new(name: :ace, rank: [1, 11])
        hand.cards << Card.new(name: :ace, rank: [1, 11])
        hand.cards << Card.new(name: :ace, rank: [1, 11])

        expect(subject).to_not be_bust
      end
    end
  end

  describe '#blackjack?' do
    context 'valid patterns' do
      before { hand.cards << Card.new(name: :ace, rank: [1, 11]) }

      it 'ace with ten is a blackjack' do
        hand.cards << Card.new(name: :ten, rank: 10)

        expect(subject).to be_blackjack
      end

      it 'ace with jack is a blackjack' do
        hand.cards << Card.new(name: :jack, rank: 10)

        expect(subject).to be_blackjack
      end
    end

    context 'invalid patterns' do
      it 'ace with ace is not a blackjack' do
        hand.cards << Card.new(name: :ace, rank: [1, 11])
        hand.cards << Card.new(name: :ace, rank: [1, 11])

        expect(subject).to_not be_blackjack
      end

      it 'three cards are not a blackjack' do
        hand.cards << Card.new(name: :ace, rank: [1, 11])
        hand.cards << Card.new(name: :ace, rank: [1, 11])
        hand.cards << Card.new(name: :nine, rank: 9)

        expect(subject).to_not be_blackjack
      end

      it 'two low cards are not a blackjack' do
        hand.cards << Card.new(name: :two, rank: 2)
        hand.cards << Card.new(name: :four, rank: 4)

        expect(subject).to_not be_blackjack
      end
    end
  end
end
