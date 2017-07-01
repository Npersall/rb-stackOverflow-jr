post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  if logged_in?
    @question.vote(current_user.id, params[:vote_result])
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please log in to vote."]
    @best_answer = @question.best_answer
    @other_answers = @question.other_answers
    erb :'questions/show'
  end
end


post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  if logged_in?
    @answer.vote(current_user.id, params[:vote_result])
    redirect "/questions/#{@question.id}"
  else
    @best_answer = @question.best_answer
    @other_answers = @question.other_answers
    @errors = ["Please log in to vote."]
    erb :'questions/show'
  end
end




