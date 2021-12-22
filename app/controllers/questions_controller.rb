# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<p> <%= @test.questions.pluck(:title) %> </p>'
  end

  def show
    render inline: '<p> <%= @question.title %> </p>'
  end

  def create
    @question = Question.create!(title: question_params[:question][:title], test_id: question_params[:test_id])

    render plain: "New question is added to #{params[:test_id]} test."
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.permit({ question: [:title] }, :test_id, :id)
  end

  def find_test
    @test = Test.find(question_params[:test_id])
  end

  def find_question
    @question = @test.questions.find(question_params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
