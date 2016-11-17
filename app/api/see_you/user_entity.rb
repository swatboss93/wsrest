class SeeYou::UserEntity < Grape::Entity
  expose :id
  expose :name
  expose :email
  expose :snapchat
  expose :whatsapp
  expose :facebook
  expose :instagram
  expose :pictures, using: SeeYou::PictureEntity
end
