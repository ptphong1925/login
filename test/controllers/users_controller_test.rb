require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, lock_version: @user.lock_version, orders_count: @user.orders_count, password_digest: @user.password_digest, role: @user.role, token_user: @user.token_user, username: @user.username, visits: @user.visits } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, lock_version: @user.lock_version, orders_count: @user.orders_count, password_digest: @user.password_digest, role: @user.role, token_user: @user.token_user, username: @user.username, visits: @user.visits } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
