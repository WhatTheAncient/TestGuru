# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render inline: "<p> <%= Test.find(#{params[:test_id]}).questions.pluck(:title)%> </p>" }
      format.text { render plain: 'All tests' }
    end
  end

  def show

  end

  def create
    q = Question.create!(title: question_params[:question][:title], test_id: question_params[:test_id])
    render plain: "New question is added to #{params[:test_id]} test."
  end

  def destroy

  end

  private

  def question_params
    params.permit({ question: [:title] }, :test_id)
  end
end
