class BookingsController < ApplicationController
    def create
        booking = Booking.create(
        user_id: current_user.id,
        car_id: params[:car_id],
        book_start: params[:book_start],
        book_end: params[:book_end],
        # duration: params[:duration],
        # total_price: params[:total_price],
        )
        if booking.save
            render json: { message: "Booked!" }, status: :created
        else
            render json: { errors: booking.errors.full_messages }, status: :bad_request
        end
    end

    def index
        @bookings = Booking.all
        render :index
    end

    def show
        @booking = Booking.find_by(id: params[:id])
        render :show
    end
end
