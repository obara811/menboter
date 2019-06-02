class Problem < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
end
