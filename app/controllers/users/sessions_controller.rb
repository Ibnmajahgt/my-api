class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  # Disable flash messages to prevent errors in API responses
  def set_flash_message!(*args); end
end
