class Booking < ApplicationRecord
    belongs_to :car
    belongs_to :user

    def duration
        (days = book_end - book_start).to_i
    end
    
    def total_price
       total_price = rate * days
    end
end
