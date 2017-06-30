class Answer < ActiveRecord::Base
  belongs_to :responder, class_name: 'User'
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :body, :responder_id, :question_id, { presence: true }
  validates_uniqueness_of :best_answer, scope:  :question_id
end
