class User < ActiveRecord::Base
  has_many :activities

  def sync_rides
    client = Strava::Api::V3::Client.new(access_token: strava_access_token)

    begin
      last_sync_time = activities.order(start_date: :desc).first&.start_date.to_i

      results = client.list_athlete_activities after: last_sync_time

      results.select { |result| result["type"] == "Ride" }.each do |result|
        activities.find_or_create_by strava_id: result["id"] do |activity|
          activity.assign_attributes(
            name: result["name"],
            start_date: Time.parse(result["start_date"]).utc
          )
        end
      end
    end until results.none?
  end
end
