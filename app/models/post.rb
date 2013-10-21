class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
