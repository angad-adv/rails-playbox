class ApplicationController < ActionController::API
    include Authenticatable
    # set the current user globally here, and now we can access it from anywhere
    def current_user
        @current_user 
    end
end
  