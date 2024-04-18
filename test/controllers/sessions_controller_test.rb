require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", birthdate: "2002-02-02"}
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    assert_response 201
  
    data = JSON.parse(response.body)
    assert_equal ["jwt", "email", "user_id"], data.keys
  end
end
