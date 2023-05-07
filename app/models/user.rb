class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  before_save { self.email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }

  enum admin: { admin: 1, general: 0 }
  has_many :problems
end
