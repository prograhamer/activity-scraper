class SessionsController < ApplicationController
  skip_before_action :set_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_or_initialize_by(strava_uid: auth_hash.uid)

    @user.update!(
      email: auth_hash.info.email,
      first_name: auth_hash.info.firstname,
      last_name: auth_hash.info.lastname,
      strava_access_token: auth_hash.credentials.token
    )

    session[:user_id] = @user.id

    redirect_to :root
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
