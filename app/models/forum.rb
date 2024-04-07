class Forum < ApplicationRecord

  # associations
  belongs_to :diagnosis

  has_many :posts 

  # validations

  # actions
end
