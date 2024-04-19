class Booking < ApplicationRecord
    belongs_to :car
    belongs_to :user

    # def duration
    #     (days = book_end - book_start).to_i
    # end
    
    # def price
    #    total_price = rate * days
    #    total_price
    # end
end
