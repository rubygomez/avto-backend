class Booking < ApplicationRecord
    belongs_to :car
    belongs_to :user
    
    # def total_price
    #     days = (book_end - book_start).to_i
    #     car.rate = bookings_rate
    #     total_price = (bookings_rate * days)
    # end
end
