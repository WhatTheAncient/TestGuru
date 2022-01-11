class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update result gist]

  def show; end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  def result; end

  def gist
    request_result = GistQuestionService.new(@result.current_question).call

    flash_options = if request_result.success?
                      { notice: t('.success') }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
