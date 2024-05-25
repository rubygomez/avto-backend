require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Booking.count", 1 do
      post "/bookings.json", params: { user_id: Booking.first.id, car_id: 3, book_start: "2024-05-05", book_end:"2024-06-06" } #total_price: 1830.65
      assert_response 200
    end
  end

  test "index" do
    get "/bookings.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Booking.count, data.length
  end

  test "show" do
    get "/bookings/#{Booking.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "car_id", "book_start", "book_end", "created_at", "updated_at"], data.keys #"total_price"
  end
end
