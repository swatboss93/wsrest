class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :snapchat, :whatsapp, :facebook, :instagram
  has_many :pictures
end
