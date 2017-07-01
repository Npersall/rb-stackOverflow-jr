class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: 'User'
  belongs_to :votable, polymorphic: true
  validates :votable_id, :votable_type, :voter_id, { presence: true }
  validates :vote_direction, inclusion: { in: [-1, 1] }

  validates :voter_id, uniqueness: { scope: [:votable_id, :votable_type] }
end
