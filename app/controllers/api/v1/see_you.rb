class API::V1::SeeYou < Grape::API
  version 'v1' # path-based versioning by default
  format :json # We don't like xml anymore
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
        present user, with: API::V1::UserEntity
      else
        user.errors.full_messages
      end
    end

    desc "Return list of hussars"
    get do
      present User.all.first, with: API::V1::UserEntity
    end
  end
end
