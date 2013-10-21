class User < ActiveRecord::Base
  attr_accessible :name, :role

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :role, presence: true
end
