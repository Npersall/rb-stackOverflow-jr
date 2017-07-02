post '/questions/:id/votes' do
  @question = Question.find(params[:id])

  if logged_in?
    if @question.has_voted?(current_user.id)
      if request.xhr?
        status 422
        "You've already voted for this question."
      else
        @errors = ["You've already voted for this question."]
        erb :'questions/show'
      end
    else
      @question.vote(current_user.id, params[:vote_result])
      if request.xhr?
        @question.vote_sum.to_s
      else
        redirect "/questions/#{@question.id}"
      end
    end
  else
    if request.xhr?
      status 403
      "Please log in to vote."
    else
      @errors = ["Please log in to vote."]
      erb :'questions/show'
    end
  end
end

post '/answers/:id/votes' do
  @answer = Answer.find(params[:id])
  @question = @answer.question

  if logged_in?
    if @answer.has_voted?(current_user.id)
      if request.xhr?
        status 422
        "You've already voted for this answer."
      else
        @errors = ["You've already voted for this answer."]
        erb :'questions/show'
      end
    else
      @answer.vote(current_user.id, params[:vote_result])
      if request.xhr?
        @answer.vote_sum.to_s
      else
        redirect "/questions/#{@question.id}"
      end
    end
  else
    if request.xhr?
      status 403
      "Please log in to vote."
    else
      @errors = ["Please log in to vote."]
      erb :'questions/show'
    end
  end
end


# post '/answers/:id/votes' do
#   @answer = Answer.find(params[:id])
#   @question = @answer.question

#   if logged_in?
#     if @answer.has_voted?(current_user.id)
#       @errors = ["You've already voted for this answer."]
#       erb :'questions/show'
#     else
#       @answer.vote(current_user.id, params[:vote_result])
#       redirect "/questions/#{@question.id}"
#     end
#   else
#     @errors = ["Please log in to vote."]
#     erb :'questions/show'
#   end
# end




