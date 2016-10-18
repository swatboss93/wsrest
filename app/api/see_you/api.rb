require 'doorkeeper/grape/helpers'

class SeeYou::API < Grape::API
  helpers Doorkeeper::Grape::Helpers

  before do
    doorkeeper_authorize!
  end

  helpers do 
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
  version 'v1', using: :path
  format :json 
  #include API::V1::Defaults

  resource :public do
    desc "Create a user"
    params do
      requires :user, type: Hash do
        requires :name, type: String, desc: 'Name of user'
        requires :email, type: String, desc: 'Email of user'
        requires :password, type: String, desc: 'Password of user'
        requires :password_confirmation, type: String, desc: 'Confirmation of password'
      end
    end
    post do
      user = User.new(params[:user])
      if user.save
        present user, with: SeeYou::UserEntity
      else
        user.errors.full_messages
      end
    end

    desc "All users"
    get do
      present current_resource_owner, with: SeeYou::UserEntity
    end
  end

  resource :private do
    desc "Update a user"
    params do
      requires :user, type: Hash do
        requires :email, type: String, desc: 'Email of user'
      end
    end
    put ':id' do
      user = User.find(params[:id])
      #newUser = User.new(params[:user])
      if user.update(params[:user])
        present user, with: SeeYou::UserEntity
      else
        user.errors.full_messages
      end
    end

    desc "Delete a user"
    params do
      requires :user, type: Hash do
        requires :email, type: String, desc: 'Email of user'
        requires :password, type: String, desc: 'Password of user'
      end
    end
    delete ':id' do
      user = User.find(params[:id])
      user.authenticate(params[:user][:password])
      if user.authenticate(params[:user][:password])
        user.destroy
      else
        "Unable to delete user"
      end
    end
  end
end
