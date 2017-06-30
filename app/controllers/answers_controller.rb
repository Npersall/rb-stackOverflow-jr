post '/answers' do
  @answer = Answer.new(body: params[:body], responder_id: session[:user_id], question_id: params[:question_id])
  @question = @answer.question
  if @answer.save
    "answer saved successfully"
    redirect "questions/#{params[:question_id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end
