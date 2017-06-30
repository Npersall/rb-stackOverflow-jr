get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @best_answer = @question.answers.find_by(best_answer: true)
  @other_answers = @question.answers.where(best_answer: false)
  erb :'/questions/show'
end
