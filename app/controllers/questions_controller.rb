get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @best_answer = @question.best_answer
  @other_answers = @question.other_answers
  erb :'/questions/show'
end
