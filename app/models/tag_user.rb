class TagUser < ApplicationRecord
  belongs_to :problem
  belongs_to :tag
end
