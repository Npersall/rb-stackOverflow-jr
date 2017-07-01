module Votable
  def vote_sum
    self.votes.reduce(0) { |sum, vote| sum + vote.vote_direction }
  end

  def has_voted?(voter_id)
    self.votes.pluck(:voter_id).include?(voter_id)
  end

  def vote(voter_id, vote_direction)
    case vote_direction
    when "Upvote"
      vote_value = 1
    when "Downvote"
      vote_value = -1
    end

    new_vote = self.votes.create(voter_id: voter_id, vote_direction: vote_value)
    new_vote
  end
end
