require 'test_helper'

class UserTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_tag = user_tags(:one)
  end

  test "should get index" do
    get user_tags_url, as: :json
    assert_response :success
  end

  test "should create user_tag" do
    assert_difference('UserTag.count') do
      post user_tags_url, params: { user_tag: { tag_id: @user_tag.tag_id, user_id: @user_tag.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_tag" do
    get user_tag_url(@user_tag), as: :json
    assert_response :success
  end

  test "should update user_tag" do
    patch user_tag_url(@user_tag), params: { user_tag: { tag_id: @user_tag.tag_id, user_id: @user_tag.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_tag" do
    assert_difference('UserTag.count', -1) do
      delete user_tag_url(@user_tag), as: :json
    end

    assert_response 204
  end
end
