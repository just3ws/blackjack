# frozen_string_literal: true

# RSpec.describe Table do
#   xit 'has a dealer' do
#     Dealer.new.tap do |dealer|
#       dealer.take_ownership_of(game: subject)
#     end
#     expect(subject.dealer).to be_an_instance_of(Dealer)
#   end
#
#   context 'starting a new game' do
#     context 'without players' do
#       xit 'cannot start' do
#         expect(subject).to_not be_ready
#       end
#     end
#
#     context 'player one has entered the game' do
#       let(:player_one) { VirtualPlayer.new }
#
#       xit 'can let a player join the game' do
#         expect do
#           Dealer.new.tap do |dealer|
#             dealer.take_ownership_of(game: subject)
#           end
#           player_one.enter(game: subject)
#         end.to change { subject.ready? }.from(false).to(true)
#       end
#     end
#   end
# end
