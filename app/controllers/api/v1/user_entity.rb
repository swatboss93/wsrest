class API::V1::UserEntity < Grape::Entity
  expose :id
  expose :name 
  expose :email
  expose :snapchat
  expose :whatsapp
  expose :facebook
  expose :instagram
  expose :pictures, using: API::V1::PictureEntity
end