require 'omniauth/strategies/strava'

Rails.application.config.middleware.use OmniAuth::Builder do
  secrets = Rails.application.secrets

  provider :strava, secrets.strava_client_id, secrets.strava_client_secret
end
