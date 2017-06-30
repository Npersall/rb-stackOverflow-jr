class Question < ActiveRecord::Base
  include Votable
  belongs_to :author, class_name: 'User'
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :author_id, :title, :body, { presence: true }n
end
