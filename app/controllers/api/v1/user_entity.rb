class API::V1::UserEntity < Grape::Entity
  expose :name 
  expose :email
  expose :snapchat
  expose :whatsapp
  expose :facebook
  expose :instagram
  #expose :pictures
end