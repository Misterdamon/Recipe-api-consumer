class Comment < ActiveRecord::Base
  attr_accessible :body, :votes
  validates :body, presence: true
end
