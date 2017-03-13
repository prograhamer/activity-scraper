class SessionsController < ApplicationController
  def create
    Rails.logger.info auth_hash.inspect
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
