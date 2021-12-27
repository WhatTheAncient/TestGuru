module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      "Edit #{question.test.title} test question"
    else
      "Create #{test.title} test question"
    end
  end
end

