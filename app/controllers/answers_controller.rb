class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[show]

  def index
    @answers = Answer.all
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
