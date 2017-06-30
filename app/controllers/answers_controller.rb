post '/answers' do
  @answer = Answer.new(body: params[:body], responder_id: session[:user_id], question_id: params[:question_id], best_answer: false)
  @question = @answer.question
  if @answer.save
    "answer saved successfully"
    redirect "questions/#{params[:question_id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end

put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @question.best_answer = @answer
  redirect "/questions/#{@question.id}"
end
