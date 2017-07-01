post '/questions/:id/votes' do
  @question = Question.find(params[:id])
  if logged_in?
    case params[:vote_result]
    when "Upvote"
      new_vote = @question.upvote(session[:id])
    when "Downvote"
      new_vote = @question.downvote(session[:id])
    end

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
    case params[:vote_result]
    when "Upvote"
      new_vote = @answer.upvote(session[:id])
    when "Downvote"
      new_vote = @answer.downvote(session[:id])
    end

    redirect "/questions/#{@question.id}"
  else
    @best_answer = @question.best_answer
    @other_answers = @question.other_answers
    @errors = ["Please log in to vote."]
    erb :'questions/show'
  end
end




