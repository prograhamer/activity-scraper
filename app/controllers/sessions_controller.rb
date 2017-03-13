class SessionsController < ApplicationController
  def create
    Rails.logger.info auth_hash.inspect
    render nothing: true, status: 200
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
