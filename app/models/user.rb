class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :username, presence: true

  has_secure_password

  has_many :pictures
end
