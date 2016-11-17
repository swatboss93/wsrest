class SeeYou::API < Grape::API
  version 'v1', using: :path
  default_format :json
  format :json
  use ::WineBouncer::OAuth2

  helpers do
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end

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
  end

  resource :private do
    desc "Recover resource owner"
    oauth2
    get do
      present resource_owner, with: SeeYou::UserEntity
    end

    desc "Update a user"
    oauth2
    params do
      requires :user, type: Hash do
        requires :email, type: String, desc: 'Email of user'
      end
    end
    put ':id' do
      user = User.find(params[:id])
      if(resource_owner === user)
        if user.update(params[:user])
          present user, with: SeeYou::UserEntity
        else
          user.errors.full_messages
        end
      else
        {error: "User is not valid"}
      end
    end

    desc "Delete a user"
    oauth2
    params do
      requires :user, type: Hash do
        requires :email, type: String, desc: 'Email of user'
      end
    end
    delete ':id' do
      user = User.find(params[:id])
      if user == resource_owner
        user.destroy
        {success: "User deleted"}
      else
        {error: "Invalid user"}
      end
    end
  end
end
