class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: 'User'
  belongs_to :commentable, polymorphic: true
  validates :commenter_id, :body, :commentable_id, :commentable_type, { presence: true }
end
