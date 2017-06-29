class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question


  validates :body, :user_id, :question_id, { presence: true }
end
