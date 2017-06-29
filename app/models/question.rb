class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers


  validates :user_id, :title, :body, { presence: true }
end
