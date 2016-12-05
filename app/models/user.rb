class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { minimum: 2 }
  validates :latitude, :allow_nil => true, numericality: { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }
  validates :longitude, :allow_nil => true, numericality: { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :pictures
  has_many :user_tags
  has_many :tags, through: :user_tags
end
