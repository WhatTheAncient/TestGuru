class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  RequestResult = Struct.new(:html_url) do
    def success?
      !html_url.nil?
    end
  end

  def call
    @created_gist = @client.create_gist(gist_params)
    RequestResult.new(html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title, @question.answers.pluck(:title)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def html_url
    @created_gist.html_url if @created_gist
  end
end
