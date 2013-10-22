class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
