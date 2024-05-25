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
    rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error "ActiveRecord Error: #{e.message}"
        render json: { error: "Bookings not found" }, status: :not_found
    end

    def show
        @booking = Booking.includes(:car).find_by(id: params[:id])
        if @booking && @booking.user_id == current_user.id
            render json: @booking, include: [:car]
        else
            render json: { error: "booking not found or unauthorized" }, status: :not_found
        end
    end

    def destroy
        @booking = Booking.find_by(id: params[:id])
        if @booking && @booking.user_id == current_user.id
            @booking.destroy
            render json: { message: "Successfully removed"}
        else
            render json: { error: "booking not found or unauthorized" }, status: :not_found
        end
    end
end
