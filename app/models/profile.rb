class Profile < ApplicationRecord

  # associations
  belongs_to :user
  
  has_many :diagnosis_profiles
  has_many :diagnosis, through: :diagnosis_profiles

  # validations
  # validates :username, presence: true

  # actions
end
