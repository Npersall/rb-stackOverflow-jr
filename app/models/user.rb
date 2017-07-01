class User < ActiveRecord::Base
  has_many :answers, foreign_key: :responder_id
  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  validates :username, { presence: true, uniqueness: true }
  validates :password_hash, { presence: true }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  #needs possible rework
  def self.authenticate(username,password)
    @user = User.find_by(username: username)
    return @user if @user && @user.password == password
    nil
  end
end
