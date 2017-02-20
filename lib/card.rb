# frozen_string_literal: true

class Card
  attr_accessor :suit, :name, :rank

  attr_reader :type
  attr_reader :card_character, :suit_character
  attr_reader :token

  def initialize(suit: nil, name: nil, rank: nil, downcard: true)
    @suit = suit
    @name = name
    @rank = rank
    @downcard = downcard
    @token = tokenize
  end

  def upcard!
    @downcard = false

    self
  end
  alias up! upcard!

  def upcard?
    !@downcard
  end
  alias up? upcard?

  def downcard?
    @downcard
  end
  alias down? downcard?

  def as_token
    return 'AC' if name == :ace
    rank.to_s.rjust(2, '0')
  end

  def for_humans
    "#{name.capitalize} of #{suit.capitalize}"
  end

  def as_graph
    {
      card: {
        token: as_token,
        suit: suit,
        name: name,
        downcard?: downcard?,
        upcard?: upcard?,
        rank: rank
      }
    }
  end

  def tokenize
    return 'AC' if name == :ace
    name.to_s.rjust(2, '0')
  end
end
