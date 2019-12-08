class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  enum admin: { admin: 1, general: 0 }

  validates :name, presence: true
  has_many :problems
end
