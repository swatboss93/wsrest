class UserTagsController < ApplicationController
  before_action :set_user_tag, only: [:show, :update, :destroy]

  # GET /user_tags
  def index
    @user_tags = UserTag.all

    render json: @user_tags
  end

  # GET /user_tags/1
  def show
    render json: @user_tag
  end

  # POST /user_tags
  def create
    @user_tag = UserTag.new(user_tag_params)

    if @user_tag.save
      render json: @user_tag, status: :created, location: @user_tag
    else
      render json: @user_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_tags/1
  def update
    if @user_tag.update(user_tag_params)
      render json: @user_tag
    else
      render json: @user_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_tags/1
  def destroy
    @user_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tag
      @user_tag = UserTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_tag_params
      params.require(:user_tag).permit(:user_id, :tag_id)
    end
end
