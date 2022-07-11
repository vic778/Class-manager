class StudentUp < ApplicationRecord
  belongs_to :room
  belongs_to :user
  belongs_to :home_work

  mount_uploader :assignment, ProfilePictureUploader

  validates :assignment, presence: true
end
