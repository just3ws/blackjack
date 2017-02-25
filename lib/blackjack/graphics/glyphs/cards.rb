# encoding: utf-8
# frozen_string_literal: true

module Blackjack
  module Graphics
    module Glyphs
      CARDS = {
        { rank: :ace, suit: :clubs } => '🂡',
        { rank: :ace, suit: :diamonds } => '🃁',
        { rank: :ace, suit: :hearts } => '🂱',
        { rank: :ace, suit: :spades } => '🃑',
        { rank: :two, suit: :clubs } => '🂢',
        { rank: :two, suit: :diamonds } => '🃂',
        { rank: :two, suit: :hearts } => '🂲',
        { rank: :two, suit: :spades } => '🃒',
        { rank: :three, suit: :clubs } => '🂣',
        { rank: :three, suit: :diamonds } => '🃃',
        { rank: :three, suit: :hearts } => '🂳',
        { rank: :three, suit: :spades } => '🃓',
        { rank: :four, suit: :clubs } => '🂤',
        { rank: :four, suit: :diamonds } => '🃄',
        { rank: :four, suit: :hearts } => '🂴',
        { rank: :four, suit: :spades } => '🃔',
        { rank: :five, suit: :clubs } => '🂥',
        { rank: :five, suit: :diamonds } => '🃅',
        { rank: :five, suit: :hearts } => '🂵',
        { rank: :five, suit: :spades } => '🃕',
        { rank: :six, suit: :clubs } => '🂦',
        { rank: :six, suit: :diamonds } => '🃆',
        { rank: :six, suit: :hearts } => '🂶',
        { rank: :six, suit: :spades } => '🃖',
        { rank: :seven, suit: :clubs } => '🂧',
        { rank: :seven, suit: :diamonds } => '🃇',
        { rank: :seven, suit: :hearts } => '🂷',
        { rank: :seven, suit: :spades } => '🃗',
        { rank: :eight, suit: :clubs } => '🂨',
        { rank: :eight, suit: :diamonds } => '🃈',
        { rank: :eight, suit: :hearts } => '🂸',
        { rank: :eight, suit: :spades } => '🃘',
        { rank: :nine, suit: :clubs } => '🂩',
        { rank: :nine, suit: :diamonds } => '🃉',
        { rank: :nine, suit: :hearts } => '🂹',
        { rank: :nine, suit: :spades } => '🃙',
        { rank: :ten, suit: :clubs } => '🂪',
        { rank: :ten, suit: :diamonds } => '🃊',
        { rank: :ten, suit: :hearts } => '🂺',
        { rank: :ten, suit: :spades } => '🃚',
        { rank: :jack, suit: :clubs } => '🂫',
        { rank: :jack, suit: :diamonds } => '🃋',
        { rank: :jack, suit: :hearts } => '🂻',
        { rank: :jack, suit: :spades } => '🃛',
        { rank: :queen, suit: :clubs } => '🂭',
        { rank: :queen, suit: :diamonds } => '🃍',
        { rank: :queen, suit: :hearts } => '🂽',
        { rank: :queen, suit: :spades } => '🃝',
        { rank: :king, suit: :clubs } => '🂮',
        { rank: :king, suit: :diamonds } => '🃎',
        { rank: :king, suit: :hearts } => '🂾',
        { rank: :king, suit: :spades } => '🃞'
      }.freeze
    end
  end
end
