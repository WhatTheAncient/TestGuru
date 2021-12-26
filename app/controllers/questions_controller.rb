# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render :show
  end

  def new
    @question = Question.new
  end

  def edit
    render :edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    redirect_to test_questions_path(@question.destroy.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
