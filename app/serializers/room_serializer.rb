class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :field, :users
  has_many :users
end
