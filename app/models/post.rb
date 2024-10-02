class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :description, presence: true
  validates :description,  length: { in: 1..280 }
end
