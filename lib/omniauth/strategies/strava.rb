require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2
      option :name, 'strava'

      option :authorize_options, %i(scope, response_type)
      option :authorize_params, response_type: 'code', scope: 'view_private'

      option :client_options, {
        site: 'https://strava.com/',
        authorize_url: 'https://www.strava.com/oauth/authorize',
        token_url: 'https://www.strava.com/oauth/token'
      }

      info do
        data["athlete"].slice *%w(email firstname lastname created_at)
      end

      uid do
        data["athlete"]["id"]
      end

      private

      def data
        access_token.params
      end
    end
  end
end
