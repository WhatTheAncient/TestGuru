class GistsController < ApplicationController
  def create
    @result = Result.find(params[:result_id])
    request_result = GistQuestionService.new(@result.current_question).call

    flash_options = if request_result.success?
                      current_user.gists.create!(
                        url: request_result.html_url,
                        question: @result.current_question
                      )
                      { notice: t('.success', link: request_result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @result, flash_options
  end
end