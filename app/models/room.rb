class Room < ApplicationRecord
  has_many :class_rooms
  has_many :users, through: :class_rooms
  has_many :home_works
  has_many :student_ups

  validates :name, presence: true, uniqueness: true
  validates :field, presence: true, uniqueness: true
end
