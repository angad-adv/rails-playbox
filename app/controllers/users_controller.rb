class UsersController < ApplicationController
    # Allow login without JWT
    skip_before_action :authenticate_request, only: [:login]
  
    # POST /users/login
    def login
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        token = JsonWebToken.encode(user_id: user.id)
  
        render json: {
          token: token,
          user: {
            id: user.id,
            email: user.email
          }
        }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    # GET /users
    def index
      render json: {
        message: "Authenticated",
        current_user: {
          id: @current_user.id,
          email: @current_user.email
        }
      }
    end
  end
  