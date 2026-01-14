module Authenticatable
    extend ActiveSupport::Concern
  
    # “Whenever a controller includes Authenticatable, 
    # automatically register a before_action”
    included do
      before_action :authenticate_request
    end
  
    def authenticate_request
      header = request.headers["Authorization"]
      token = header&.split(" ")&.last
  
      decoded = JsonWebToken.decode(token)
      user_id = decoded[:user_id]
      @current_user = User.find_by(id: user_id) if decoded
  
      render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
    end
end
  