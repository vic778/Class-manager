class Annonce < ApplicationRecord
  validates :message, presence: true
end
