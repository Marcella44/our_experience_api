class Diagnosis < ApplicationRecord
  
  # associations
  has_many :diagnosis_profiles
  has_many :profiles, through: :diagnosis_profiles
  has_one :forum, dependent: :destroy

  # validations

  # actions
  after_create :create_forum


  private

  def create_forum
    Forum.create(diagnosis: self)
  end
end
