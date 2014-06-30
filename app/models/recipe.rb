class Recipe < ActiveRecord::Base
  attr_accessible :title, :content, :votes, :image_url
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
end
