# frozen_string_literal: true

require_relative '../../../../../lib/blackjack/players/player/hand'
require_relative '../../../../../lib/blackjack/cards/card'

module Blackjack
  module Players
    class Player
      RSpec.describe Hand do
        it 'starts with no cards' do
          expect(subject.cards).to be_empty
        end

        # describe '#pair?' do
        #   it 'two aces' do
        #     subject.cards << Blackjack::Cards::Card.new(rank: :ace, suit: :spades)
        #     subject.cards << Blackjack::Cards::Card.new(rank: :ace, suit: :hearts)

        #     expect(subject).to be_pair
        #   end
        #   #
        #   #     xit 'a facecard and a ten are actually pairs' do
        #   #       subject.cards << Card.new(name: :king, rank: 10)
        #   #       subject.cards << Card.new(name: :ten, rank: 10)
        #   #
        #   #       expect(subject).to be_pair
        #   #     end
        #   #
        #   #     xit 'three cards are not a pair though' do
        #   #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #   #       subject.cards << Card.new(name: :king, rank: 10)
        #   #       subject.cards << Card.new(name: :four, rank: 4)
        #   #
        #   #       expect(subject).to_not be_pair
        #   #     end
        #   #
        #   #     xit 'two different cards are not a pair' do
        #   #       subject.cards << Card.new(name: :king, rank: 10)
        #   #       subject.cards << Card.new(name: :four, rank: 4)
        #   #
        #   #       expect(subject).to_not be_pair
        #   #     end
        # end

        def ace_card; end

        let(:death_card) { Blackjack::Cards::Card.new(rank: :ace, suit: :spades) }
        let(:pigs_eye) { Blackjack::Cards::Card.new(rank: :ace, suit: :diamonds) }
        let(:the_crispin) { Blackjack::Cards::Card.new(rank: :ace, suit: :hearts) }
        let(:clover) { Blackjack::Cards::Card.new(rank: :ace, suit: :clubs) }

        let(:the_curse_of_mexico) { Blackjack::Cards::Card.new(rank: :two, suit: :spades) }

        let(:the_devils_bedpost) { Blackjack::Cards::Card.new(rank: :four, suit: :clubs) }

        let(:loyalty_at_the_risk_of_death) { Blackjack::Cards::Card.new(rank: :six, suit: :hearts) }

        let(:beer_card) { Blackjack::Cards::Card.new(rank: :seven, suit: :diamonds) }

        let(:scourge_of_scotland) { Blackjack::Cards::Card.new(rank: :nine, suit: :diamonds) }

        let(:big_cassino) { Blackjack::Cards::Card.new(rank: :ten, suit: :diamonds) }

        let(:ogier) { Blackjack::Cards::Card.new(rank: :jack, suit: :spades) }
        let(:laughing_boy) { Blackjack::Cards::Card.new(rank: :jack, suit: :diamonds) }
        let(:la_hire) { Blackjack::Cards::Card.new(rank: :jack, suit: :hearts) }
        let(:lancelot) { Blackjack::Cards::Card.new(rank: :jack, suit: :clubs) }

        let(:argine) { Blackjack::Cards::Card.new(rank: :queen, suit: :clubs) }
        let(:calamity_jane) { Blackjack::Cards::Card.new(rank: :queen, suit: :spades) }
        let(:helen_of_troy) { Blackjack::Cards::Card.new(rank: :queen, suit: :hearts) }

        let(:alexander) { Blackjack::Cards::Card.new(rank: :king, suit: :clubs) }
        let(:david) { Blackjack::Cards::Card.new(rank: :king, suit: :spades) }
        let(:suicide_king) { Blackjack::Cards::Card.new(rank: :king, suit: :hearts) }
        let(:the_man_with_the_axe) { Blackjack::Cards::Card.new(rank: :king, suit: :diamonds) }

        describe '#hard?' do
          it 'thirteen total forces ace to hard' do
            subject.cards << death_card
            subject.cards << pigs_eye

            expect(subject).to be_hard
            expect(subject).to_not be_soft
          end
          #
          #     xit 'fifteen total forces ace to hard' do
          #       subject.cards << Card.new(name: :ace, rank: [1, 11])
          #       subject.cards << Card.new(name: :six, rank: 6)
          #       subject.cards << Card.new(name: :nine, rank: 9)
          #
          #       expect(subject).to be_hard
          #       expect(subject).to_not be_soft
          #     end
          #
          #     xit 'treats blackjack as soft' do
          #       subject.cards << Card.new(name: :ace, rank: [1, 11])
          #       subject.cards << Card.new(name: :ten, rank: 10)
          #
          #       expect(subject).to be_soft
          #       expect(subject).to_not be_hard
          #       expect(subject).to be_blackjack
        end

        #     xit 'ten with four aces has forces all aces hard' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ten, rank: 10)
        #
        #       expect(subject).to be_hard
        #       expect(subject).to_not be_soft
        #     end
        #   end
        #
        #   describe '#soft?' do
        #     xit 'three total has room for soft ace' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :three, rank: 3)
        #
        #       expect(subject).to be_soft
        #       expect(subject).to_not be_hard
        #     end
        #
        #     xit 'two with four aces has room for a soft ace' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :two, rank: 2)
        #
        #       expect(subject).to be_soft
        #       expect(subject).to_not be_hard
        #     end
        #   end
        #
        #   describe '#hard_count' do
        #     xit 'treats aces as one' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject.hard_count).to eq(2)
        #     end
        #
        #     xit 'treats calculates normal card with ace' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ten, rank: 10)
        #
        #       expect(subject.hard_count).to eq(11)
        #     end
        #
        #     xit 'totals hands without aces' do
        #       subject.cards << Card.new(name: :two, rank: 2)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :nine, rank: 9)
        #
        #       expect(subject.hard_count).to eq(21)
        #     end
        #   end
        #
        #   describe '#twenty_one?' do
        #     xit 'is blackjack' do
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject).to be_blackjack
        #     end
        #
        #     xit 'king+king+ace is ten+ten+one' do
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject).to be_twenty_one
        #     end
        #
        #     xit 'nine+ace+ace equals nine+one+eleven' do
        #       subject.cards << Card.new(name: :nine, rank: 9)
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject).to be_twenty_one
        #     end
        #
        #     xit 'five+six equals eleven so not blackjack' do
        #       subject.cards << Card.new(name: :five, rank: 5)
        #       subject.cards << Card.new(name: :six, rank: 6)
        #
        #       expect(subject).to_not be_blackjack
        #     end
        #
        #     xit 'three+two+nine+seven is twenty_one' do
        #       subject.cards << Card.new(name: :three, rank: 3)
        #       subject.cards << Card.new(name: :two, rank: 2)
        #       subject.cards << Card.new(name: :nine, rank: 9)
        #       subject.cards << Card.new(name: :seven, rank: 7)
        #
        #       expect(subject).to be_twenty_one
        #     end
        #   end
        #
        #   describe '#point_total' do
        #     xit 'has no aces' do
        #       subject.cards << Card.new(name: :eight, rank: 8)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :two, rank: 2)
        #
        #       expect(subject.point_total).to eq(20)
        #     end
        #
        #     xit 'is two aces' do
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject.point_total).to eq(12)
        #     end
        #
        #     xit 'has one ace' do
        #       subject.cards << Card.new(name: :eight, rank: 8)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject.point_total).to eq(19)
        #     end
        #
        #     xit 'is blackjack' do
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #       expect(subject.point_total).to eq(21)
        #     end
        #
        #     xit 'is bust' do
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #       subject.cards << Card.new(name: :king, rank: 10)
        #
        #       expect(subject.point_total).to eq(30)
        #     end
        #   end
        #
        #   describe '#bust?' do
        #     context 'hard hand' do
        #       xit 'ten+king+two is bust' do
        #         subject.cards << Card.new(name: :ten, rank: 10)
        #         subject.cards << Card.new(name: :king, rank: 10)
        #         subject.cards << Card.new(name: :two, rank: 2)
        #
        #         expect(subject).to be_bust
        #       end
        #
        #       xit 'queen+two+five+five is bust' do
        #         subject.cards << Card.new(name: :queen, rank: 10)
        #         subject.cards << Card.new(name: :two, rank: 2)
        #         subject.cards << Card.new(name: :five, rank: 5)
        #         subject.cards << Card.new(name: :five, rank: 5)
        #
        #         expect(subject).to be_bust
        #       end
        #     end
        #
        #     context 'soft hand' do
        #       xit 'ten+king+ace is not bust' do
        #         subject.cards << Card.new(name: :ten, rank: 10)
        #         subject.cards << Card.new(name: :king, rank: 10)
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #         expect(subject).to_not be_bust
        #       end
        #
        #       xit 'ace+six+ten is not bust' do
        #         subject.cards << Card.new(name: :ten, rank: 10)
        #         subject.cards << Card.new(name: :six, rank: 6)
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #         expect(subject).to_not be_bust
        #       end
        #
        #       xit 'ace+ace+ace is not bust' do
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #         expect(subject).to_not be_bust
        #       end
        #     end
        #   end
        #
        #   describe '#blackjack?' do
        #     context 'valid patterns' do
        #       before { subject.cards << Card.new(name: :ace, rank: [1, 11]) }
        #
        #       xit 'ace with ten is a blackjack' do
        #         subject.cards << Card.new(name: :ten, rank: 10)
        #
        #         expect(subject).to be_blackjack
        #       end
        #
        #       xit 'ace with jack is a blackjack' do
        #         subject.cards << Card.new(name: :jack, rank: 10)
        #
        #         expect(subject).to be_blackjack
        #       end
        #     end
        #
        #     context 'invalid patterns' do
        #       xit 'ace with ace is not a blackjack' do
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #
        #         expect(subject).to_not be_blackjack
        #       end
        #
        #       xit 'three cards are not a blackjack' do
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #         subject.cards << Card.new(name: :ace, rank: [1, 11])
        #         subject.cards << Card.new(name: :nine, rank: 9)
        #
        #         expect(subject).to_not be_blackjack
        #       end
        #
        #       xit 'two low cards are not a blackjack' do
        #         subject.cards << Card.new(name: :two, rank: 2)
        #         subject.cards << Card.new(name: :four, rank: 4)
        #
        #         expect(subject).to_not be_blackjack
        #       end
        #     end
        #   end
      end
    end
  end
end
