class Question < ActiveRecord::Base
  include Votable
  belongs_to :author, class_name: 'User'
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  validates :author_id, :title, :body, { presence: true }

  def best_answer
    self.answers.find_by(best_answer: true)
  end

  def other_answers
    self.answers.where(best_answer: false)
  end

  def best_answer=(new_best_answer)
    old_best_answer = self.best_answer
    if old_best_answer
      old_best_answer.update(best_answer: false)
    end
    new_best_answer.update(best_answer: true)
  end
end
