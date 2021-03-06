# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update destroy]

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
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    redirect_to admin_test_path(@question.destroy.test)
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
end
