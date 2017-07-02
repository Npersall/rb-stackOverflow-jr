get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'/questions/show'
end

post '/questions' do

  if session[:id] && !params[:question_body].empty? && !params[:question_title].empty?
    Question.create(author_id: session[:id], title: params[:question_title], body: params[:question_body])
    redirect '/'
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
