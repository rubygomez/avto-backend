require "test_helper"

class CarsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/cars.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Car.count, data.length
  end

  test "show" do
    get "/cars/#{Car.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "make", "model", "year", "color", "rate", "seats", "transmission"], data.keys
  end
end
