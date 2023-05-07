class Problem < ApplicationRecord
  validates :title, presence: true
  validates :answer, presence: true
  has_rich_text :answer
  belongs_to :user
end
