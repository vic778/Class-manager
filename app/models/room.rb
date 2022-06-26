class Room < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :field, presence: true, uniqueness: true
end
