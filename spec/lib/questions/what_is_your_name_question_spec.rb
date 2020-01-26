# frozen_string_literal: true

module Questions
  RSpec.describe WhatIsYourNameQuestion do
    subject(:question) { described_class.new }

    describe '#we_do_not_need_to_ask_again' do
      it "sets defaults when we don't need to ask again" do
        question.we_do_not_need_to_ask_again

        expect(question.what_they_said).to eq(described_class::GUEST)
        expect(question.answer).to eq(described_class::GUEST)
      end
    end

    describe '#did_not_understand_message' do
      it 'was an empty answer' do
        expect(question.did_not_understand_message).to eq("Sorry. I don't understand.")
      end

      it 'was a non-empty answer' do
        allow(described_class).to receive(:answer).and_return('Some text')

        question.ask.then_wait_for

        expect(question.did_not_understand_message).to eq('Sorry. I don\'t understand what you mean by "Some text".')
      end
    end

    describe '#ask' do
      before do
        # ignore the `render` class method or the spec output will be messy
        allow(described_class).to receive(:render).and_return(nil)
      end

      it 'displays the question to the player' do
        expect(described_class).to receive(:render).with(question.question)

        question.ask
      end

      context 'with empty answer from player' do
        it 'assumes the player is a guest' do
          allow(described_class).to receive(:answer).and_return('')

          question.ask.then_wait_for

          expect(question.answer).to eq(described_class::GUEST)
          expect(question.answer_normalized).to eq(described_class::GUEST.downcase)
          expect(question.what_they_said).to eq(described_class::GUEST)
        end
      end

      context 'with answer from player' do
        it "records the player's answer" do
          input = '   mike     Hall     '
          expected = 'Mike Hall'

          allow(described_class).to receive(:answer).and_return(input)

          question.ask.then_wait_for

          expect(question.answer).to eq(expected)
          expect(question.answer_normalized).to eq(expected.downcase)
          expect(question.what_they_said).to eq(input)
        end
      end
    end

    describe '.answer' do
      it 'gets player input from stdin' do
        expect($stdin).to receive(:gets)

        described_class.answer
      end
    end

    describe '.render' do
      it 'prints message to stdout' do
        message = 'Hello'

        expect($stdout).to receive(:print).with(message)

        described_class.render(message)
      end
    end

    describe '.ask' do
      it 'asks the question' do
        expect(described_class).to receive(:render).with(described_class::QUESTION)

        described_class.ask
      end
    end
  end
end
