class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  belongs_to :user
  has_many :likes
  has_many :comments
  has_one_attached :photo
  validates :description, presence: true
  validates :description,  length: { in: 1..280 }
end
