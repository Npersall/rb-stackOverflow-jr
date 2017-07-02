get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'/questions/show'
end

post '/questions' do
  if session[:id] && !params[:question_body].empty? && !params[:question_title].empty?
    @question = Question.create(author_id: session[:id], title: params[:question_title], body: params[:question_body])
    if request.xhr?
      erb :'/_new_question', layout: false
    else
      redirect '/'
    end
  else
    if request.xhr?
      if !session[:id]
        status 403
        'Please log in to post a question.'
      else
        status 422
        'Fields cannot be blank.'
      end
    else
      if !session[:id]
        @errors = ["Please log in to post a question."]
      else
        @errors = ["Fields cannot be blank."]
      end
      @questions = Question.all
      erb :'/index'
    end
  end
end
