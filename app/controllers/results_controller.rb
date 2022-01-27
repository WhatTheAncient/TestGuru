class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update result]

  def show; end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      current_user.badges << BadgesService.new(@result).badges
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def result; end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
