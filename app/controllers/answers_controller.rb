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
  old_best_answer = @question.best_answer
  @question.best_answer = @answer

  if request.xhr?
    new_best_answer_html = erb :'/_best_answer', layout: false, locals: {question: @question}
    if old_best_answer
      old_best_answer_html = erb :'/_answer', layout: false, locals: {answer: old_best_answer}
      content_type :json
      { new_best_answer: new_best_answer_html, old_best_answer: old_best_answer_html}.to_json
    else
      content_type :json
      { new_best_answer: new_best_answer_html }.to_json
    end
  else
    redirect "/questions/#{@question.id}"
  end
end
