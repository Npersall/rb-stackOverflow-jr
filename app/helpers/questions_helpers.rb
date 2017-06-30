helpers do
  def vote_sum(question)
    question.votes.reduce(0) { |sum, vote| sum + vote.vote_direction }
  end
end
