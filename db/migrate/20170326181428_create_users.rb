class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :strava_uid
      t.string :strava_access_token

      t.timestamps
    end

    add_index :users, [:strava_uid], unique: true
  end
end
