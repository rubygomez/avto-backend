class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def create
        user = User.create(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            birthdate: params[:birthdate]
        )
        if user.save
            render json: { message: "User successfully created"}, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :bad_request
        end
    end

end
