class Post < ApplicationRecord
  
  # associations
  belongs_to :forum
  belongs_to :user

  # validations
  validates :subject, presence: true
  validates :content, presence: true, length: {maximum: 5000} 

  # actions
end
