class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, unless: -> { request.format.json? }

    def current_user
        return @current_user if @current_user

        auth_headers = request.headers["Authorization"]
        if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
            token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
            begin
                decoded_token = JWT.decode(
                    token,
                    Rails.application.credentials.fetch(:secret_key_base),
                    true,
                    { algorithm: "HS256" }
                )
                @current_user = User.find_by(id: decoded_token[0]["user_id"])
            rescue JWT::ExpiredSignature, JWT::DecodeError
                nil
            end
        end
    end

    def authenticate_user
        render json: {error: "unauthorized accesss"}, status: :unauthorized unless current_user
    end
end
