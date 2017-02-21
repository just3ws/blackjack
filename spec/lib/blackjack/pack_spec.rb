# frozen_string_literal: true

RSpec.describe Pack do
  it 'has 52 cards' do
    expect(subject.open.count).to eq(52)
  end
end
