module Votable
  def vote_sum
    self.votes.reduce(0) { |sum, vote| sum + vote.vote_direction }
  end

  def upvote(voter_id)
    vote(voter_id, 1)
  end

  def downvote(voter_id)
    vote(voter_id, -1)
  end

  private

  def vote(voter_id, vote_direction)
    new_vote = Vote.create(voter_id: voter_id, vote_direction: vote_direction)
    self.votes << new_vote
    p "INSIDE VOTE HELPER METHOD"
    new_vote
  end
end
