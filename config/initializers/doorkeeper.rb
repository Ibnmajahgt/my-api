Doorkeeper.configure do
  # Enable password and other grant flows
  grant_flows %w[password client_credentials authorization_code]

  # Authenticate resource owner (user) from credentials
  resource_owner_from_credentials do |_routes|
    user = User.find_by(email: params[:email])
    user if user&.valid_password?(params[:password])
  end

  # Protect routes, ensuring the user is authenticated
  resource_owner_authenticator do
    current_user || render(json: { error: "Unauthorized" }, status: 401)
  end
end
