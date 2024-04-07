class User < ApplicationRecord
    
  has_secure_password

  # associations
  has_one :profile, dependent: :destroy
  has_many :posts

  # validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true

  # actions
  before_create :downcase_email
  after_create :create_profile

  private

  def downcase_email
    self.email = email.downcase
  end

  def create_profile
    Profile.create(user: self)
  end
end
