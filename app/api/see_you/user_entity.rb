class SeeYou::UserEntity < Grape::Entity
  expose :id
  expose :name
  expose :email
  expose :snapchat
  expose :whatsapp
  expose :facebook
  expose :instagram
  expose :gender
  expose :first_access
  expose :pictures, using: SeeYou::PictureEntity
  expose :tags, using: SeeYou::TagEntity
end
