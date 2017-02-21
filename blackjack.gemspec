# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'blackjack'
  s.version = '0.1.0'

  s.author = ['Mike Hall']
  s.email = %w(mike@just3ws.com)

  s.homepage = 'https://www.github.com/just3ws/blackjack'

  s.summary = 'Simulates a basic game of Blackjack'
  s.description = 'Rudimentary implemenation of a Blackjack simulator'
  s.licenses = ['GPLv3', 'GNU General Public License, version 3']

  s.metadata['allowed_push_host'] = 'http://push.not.allowed.to.any.host.com' if s.respond_to?(:metadata)

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = Gem::Requirement.new('>= 2.4.0')
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  s.require_paths = ['lib']
  s.bindir = 'exe'
  s.executables = 'blackjack'

  s.add_dependency 'curses', '~> 1.1.3'
  s.add_dependency 'colorize', '~> 0.8.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
