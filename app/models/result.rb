# frozen_string_literal: true

class Result < ApplicationRecord
  ENTRY_THRESHOLD = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', foreign_key: :current_question_id, optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    if current_question.nil? || time_up?
      record_total
      true
    else
      false
    end
  end

  def score
    correct_questions / test.questions.count.to_f * 100
  end

  def record_total
    self.passed = (score >= ENTRY_THRESHOLD)
    save!
  end

  def current_question_number
    test.questions.sort.index(current_question)
  end

  def time_up?
    time_left.zero?
  end

  def time_left
    lefted_time = test.timer * 60 - (Time.current - created_at).to_i if test.timer?

    lefted_time.positive? ? lefted_time : 0
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def next_question
    if current_question.nil?
      test.questions.first if test.present?
    else
      test.questions
          .order(:id)
          .where('id > ?', current_question.id)
          .first
    end
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end
end
