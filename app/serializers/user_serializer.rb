class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :snapchat, :whatsapp, :facebook, :instagram
  has_many :pictures
end
