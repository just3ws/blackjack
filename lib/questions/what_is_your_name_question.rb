# frozen_string_literal: true

module Questions
  class WhatIsYourNameQuestion
    GUEST = 'Guest'
    QUESTION = "Please enter your name then press [ENTER]:\n"

    attr_reader :answer, :answer_normalized, :what_they_said

    def self.ask
      new.tap(&:ask)
    end

    def then_wait_for
      answer = self.class.answer

      try_to_understand(their_response: answer) until responded? && answered?

      self
    end

    def ask
      self.class.render(question)

      self
    end

    def self.answer
      $stdin.gets
    end

    def self.render(output)
      $stdout.print output
    end

    include Text

    def question
      QUESTION
    end

    def did_not_understand_message
      return "Sorry. I don't understand." if answer_normalized.nil? || answer_normalized.empty?

      "Sorry. I don't understand what you mean by \"#{what_they_said}\"."
    end

    def responded?
      !(answer_normalized.nil? || answer_normalized.empty?)
    end

    def we_do_not_need_to_ask_again
      @what_they_said = GUEST
      @answer = GUEST
    end

    def answered?
      !(answer.nil? || answer.empty?)
    end

    def try_to_understand(their_response:)
      @what_they_said = their_response.to_s.freeze
      @answer_normalized = clean(what_they_said).freeze

      @answer = if answer_normalized.empty?
                  @what_they_said = GUEST.freeze
                  @answer_normalized = GUEST.downcase.freeze

                  GUEST
                else
                  answer_normalized.split(/\s+/).map(&:capitalize).join(' ').freeze
                end

      we_do_not_need_to_ask_again unless answered?
    end
  end
end
