class ApplicationController < ActionController::API
    respond_to :json
  
    # Ensure all requests require authentication unless specified
    before_action :doorkeeper_authorize!
  
    # Define the current_user method for Doorkeeper authentication
    def current_user
      return unless doorkeeper_token
      @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id)
    end
  end
  