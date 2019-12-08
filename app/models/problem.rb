class Problem < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
  has_many :tag_problems
end
