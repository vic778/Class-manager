class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :role
  belongs_to :room
end