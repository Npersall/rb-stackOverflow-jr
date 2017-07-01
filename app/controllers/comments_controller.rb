post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @best_answer = @question.best_answer
  @other_answers = @question.other_answers

  if logged_in?
    @question.comments.create(commenter: current_user, body: params[:comment_body])
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please log in to comment."]
    erb :'questions/show'
  end
end


post '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @best_answer = @question.best_answer
  @other_answers = @question.other_answers

  if logged_in?
    @answer.comments.create(commenter: current_user, body: params[:comment_body])
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Please log in to comment."]
    erb :'questions/show'
  end
end

