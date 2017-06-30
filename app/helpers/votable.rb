module Votable
  def vote_sum
    self.votes.reduce(0) { |sum, vote| sum + vote.vote_direction }
  end
end
