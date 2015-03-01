require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, user: {  name: "",
                                email: "user@invalid",
                                password_digest: "foo" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Example User",
                                            email: "user@example.com",
                                            password_digest:  "password"
}
    end
    assert_template 'users/show'
  end
end
