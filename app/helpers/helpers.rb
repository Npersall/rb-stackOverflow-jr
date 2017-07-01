helpers do

  def vote_router(votable_item)
    if votable_item.class == Question
      "/questions/#{votable_item.id}/votes"
    elsif votable_item.class == Answer
      "/answers/#{votable_item.id}/votes"
    end
  end

  def comment_router(commentable_item)
    if commentable_item.class == Question
      "/questions/#{commentable_item.id}/comments"
    elsif commentable_item.class == Answer
      "/answers/#{commentable_item.id}/comments"
    end
  end
end
