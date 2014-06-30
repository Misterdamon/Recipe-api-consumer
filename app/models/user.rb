require "bcrypt"
class User < ActiveRecord::Base
	# validates :username, presence: true, uniqueness: true
	validates :password_hash, presence: true
	attr_accessible :username, :password_hash
	include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  # Remember to create a migration!

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end