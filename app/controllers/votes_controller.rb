post '/questions/:id/votes' do
  session[:user_id] = 9
  @question = Question.find(params[:id])

  case params[:vote_result]
  when "Upvote"
    new_vote = @question.upvote(session[:user_id])
  when "Downvote"
    new_vote = @question.downvote(session[:user_id])
  end

  if new_vote.save
    redirect "/questions/#{@question.id}"
  else
    @best_answer = @question.best_answer
    @other_answers = @question.other_answers
    @errors = new_vote.errors.full_messages
    erb :'questions/show'
  end
end


post '/answers/:id/votes' do
  session[:user_id] = 9
  @answer = Answer.find(params[:id])
  @question = @answer.question

  case params[:vote_result]
  when "Upvote"
    new_vote = @answer.upvote(session[:user_id])
  when "Downvote"
    new_vote = @answer.downvote(session[:user_id])
  end

  if new_vote.save
    redirect "/questions/#{@question.id}"
  else
    @best_answer = @question.best_answer
    @other_answers = @question.other_answers
    @errors = new_vote.errors.full_messages
    erb :'questions/show'
  end
end




