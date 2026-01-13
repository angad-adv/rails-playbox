module Authenticatable
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_request
    end
  
    def authenticate_request
      header = request.headers["Authorization"]
      token  = header&.split(" ")&.last
  
      decoded = JsonWebToken.decode(token)
      @current_user = User.find_by(id: decoded[:user_id]) if decoded
  
      render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
    end
  end
  