class Comment < ApplicationRecord
  belongs_to :post
  validates :description, presence: true
  validates :description,  length: { in: 2..300 }
end
