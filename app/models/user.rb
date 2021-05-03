class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates_uniqueness_of :username

  has_many :images
end
