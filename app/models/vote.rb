class Vote < ActiveRecord::Base
  validates :votable_id, :votable_type, { presence: true }
end
