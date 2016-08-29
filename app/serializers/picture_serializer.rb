class PictureSerializer < ActiveModel::Serializer
  attributes :id, :path_to_picture
  has_one :user
end
