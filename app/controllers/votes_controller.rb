post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  @best_answer = @question.best_answer
  @other_answers = @question.other_answers

  if logged_in?
    if @question.has_voted?(current_user.id)
      @errors = ["You've already voted for this question."]
      erb :'questions/show'
    else
      @question.vote(current_user.id, params[:vote_result])
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = ["Please log in to vote."]
    erb :'questions/show'
  end
end


post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @best_answer = @question.best_answer
  @other_answers = @question.other_answers

  if logged_in?
    if @answer.has_voted?(current_user.id)
      @errors = ["You've already voted for this answer."]
      erb :'questions/show'
    else
      @answer.vote(current_user.id, params[:vote_result])
      redirect "/questions/#{@question.id}"
    end
  else

    @errors = ["Please log in to vote."]
    erb :'questions/show'
  end
end




