class CarsController < ApplicationController
    def index
        @cars = Car.all
        render :index
    end

    def show
        @car = Car.find_by(id: params[:id])
        render :show
    end
    
end
