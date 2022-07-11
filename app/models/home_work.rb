class HomeWork < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :student_ups

  validates :assignment, presence: true
  validates :course_name, presence: true

  mount_uploader :assignment, ProfilePictureUploader
end
