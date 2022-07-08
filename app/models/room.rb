class Room < ApplicationRecord
  has_many :class_rooms
  has_many :users, through: :class_rooms

  validates :name, presence: true, uniqueness: true
  validates :field, presence: true, uniqueness: true
end
