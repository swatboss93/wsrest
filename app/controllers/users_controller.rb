class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :find_user, only: [:authentication]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    pics = picture_params
    @user.pictures = pics.map{|pic| Picture.new(pic)}
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def authentication
    if !@user.nil? && @user.authenticate(params[:password])
      render json: @user
    else
      msg = "Email or password invalid".to_json
      render json: msg, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :username, :snapchat, :whatsapp, :facebook, :instagram)
    end

        # Only allow a trusted parameter "white list" through.
    def picture_params
      params.permit(:pictures => [:path_to_picture]).delete("pictures")
    end

    def find_user
      @user = User.find_by(email: params[:email])
    end
end
