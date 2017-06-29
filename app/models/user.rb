class User < ActiveRecord::Base
  has_many :answers
  has_many :questions


  validates :username, { presence: true, uniqueness: true }
  validates :password_hash, { presence: true }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
