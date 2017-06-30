get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'/questions/show'
end
