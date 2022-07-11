class HomeWork < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :assignment, presence: true
  validates :course_name, presence: true

  mount_uploader :assignment , ProfilePictureUploader
end
