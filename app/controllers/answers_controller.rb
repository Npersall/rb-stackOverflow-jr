post '/answers' do
  answer = Answer.new(body: params[:body], responder_id: session[:id], question_id: params[:question_id], best_answer: false)
  @question = answer.question

  if answer.save
    if request.xhr?
      erb :'/_answer', layout: false, locals: { answer: answer }
    else
      redirect "questions/#{params[:question_id]}"
    end
  else
    if request.xhr?
      if answer.body.empty?
        status 422
        'Answer cannot be blank.'
      elsif !logged_in?
        status 403
        'Please log into answer a question.'
      end
    else
      @errors = answer.errors.full_messages
      erb :'questions/show'
    end
  end
end

# reassigning 'best answer'
put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @question = @answer.question
  @question.best_answer = @answer
  redirect "/questions/#{@question.id}"
end
