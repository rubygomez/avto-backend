require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Booking.count", 1 do
      post "/bookings.json", params: { user_id: 1, car_id: 1, book_start: "2002-02-02", book_end:"2002-01-01", total_price: 1.0 }
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
    assert_equal ["id", "user_id", "car_id", "book_start", "book_end", "total_price"], data.keys
  end
end
