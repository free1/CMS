class User < ActiveRecord::Base
  attr_accessible :name, :role, :password, :password_confirmation
  before_save { self.name = name.downcase }

  # 安全密码
  has_secure_password 

  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :role, presence: true, inclusion: %w(member admin)
  validates :password, length: { minimum: 8 }
end
