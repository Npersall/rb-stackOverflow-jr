post '/questions/:id/comments' do
  @question = Question.find(params[:id])

  if logged_in?
    comment = @question.comments.create(commenter: current_user, body: params[:comment_body])
    if request.xhr?
      %(<p class="comment">"#{comment.body}"<br><br>Posted By: #{comment.commenter.username}</p>)
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 422
      'Please log in to comment.'
    else
      @errors = ["Please log in to comment."]
      erb :'questions/show'
    end
  end
end


post '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @question = @answer.question

  if logged_in?
    comment = @answer.comments.create(commenter: current_user, body: params[:comment_body])
    if request.xhr?
      %(<p class="comment">"#{comment.body}"<br><br>Posted By: #{comment.commenter.username}</p>)
    else
      redirect "/questions/#{@question.id}"
    end
  else
    if request.xhr?
      status 422
      'Please log in to comment.'
    else
      @errors = ["Please log in to comment."]
      erb :'questions/show'
    end
  end
end

