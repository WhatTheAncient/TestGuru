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
    current_question.nil?
  end

  def score
    correct_questions / test.questions.count.to_f * 100
  end

  def passed?
    score >= ENTRY_THRESHOLD
  end

  def current_question_number
    test.questions.sort.index(current_question)
  end

  def set_badge
    self.user.badges = received_badges
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

  def received_badges

  end
end
