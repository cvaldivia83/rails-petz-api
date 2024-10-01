class Post < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :description,  length: { in: 1..280 }
end
