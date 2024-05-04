class BookingsController < ApplicationController
    def create
        @booking = Booking.create(
        user_id: current_user.id,
        car_id: params[:car_id],
        book_start: params[:book_start],
        book_end: params[:book_end],
        )
        if @booking.save
            render json: { message: "Booked!" }, status: :created
        else
            render json: { errors: booking.errors.full_messages }, status: :bad_request
        end
    end

    def index
        @bookings = Booking.includes(:car).where(:user_id => current_user.id)
        render json: @bookings, include: [:car]
    end

    def show
        @booking = Booking.includes(:car).find_by(id: params[:id])
        render json: @booking, include: [:car]
    end

    def destroy
        @booking = Booking.find_by(id: params[:id])
        @booking.destroy
        render json: { message: "Successfully removed"}
    end
end
