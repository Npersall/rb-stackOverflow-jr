helpers do

  def vote_router(votable_item)
    if votable_item.class == Question
      "/questions/#{votable_item.id}/votes"
    elsif votable_item.class == Answer
      "/answers/#{votable_item.id}/votes"
    end
  end

end
