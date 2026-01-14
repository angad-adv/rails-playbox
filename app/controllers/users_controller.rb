class UsersController < ApplicationController
    # Allow login without JWT
    skip_before_action :authenticate_request, only: [:login, :signup]
  
    # POST /users/login
    def login
      user = User.find_by(email: params[:email]) 
  
      if user&.authenticate(params[:password]) #this is a bcrypt function
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

    def signup
        name = params[:name]
        email = params[:email]
        password = params[:password]
      
        # check if user already exists
        if User.exists?(email: email)
          return render json: {
            message: "User already exists"
          }, status: :unprocessable_entity
        end
      
        user = User.new(
          name: name,
          email: email,
          password: password
        )
      
        unless user.save
          return render json: {
            error: user.errors.full_messages
          }, status: :unprocessable_entity
        end
      
        token = JsonWebToken.encode(user_id: user.id)
      
        render json: {
          token: token,
          user: {
            id: user.id,
            email: user.email
          }
        }, status: :ok
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
  