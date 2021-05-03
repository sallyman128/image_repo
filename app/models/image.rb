class Image < ApplicationRecord
  has_one_attached :picture

  belongs_to :user

  def name_of_user
    self.user.username
  end
end
