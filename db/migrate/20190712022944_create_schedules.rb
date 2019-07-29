class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :match_day, null:false
      t.integer :home_team, null:false
      t.integer :away_team, null:false
      t.string :venue, null:false
      t.integer :home_team_score
      t.integer :away_team_score 

      t.timestamps
    end
  end
end
