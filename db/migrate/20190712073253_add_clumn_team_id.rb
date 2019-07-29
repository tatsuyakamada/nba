class AddClumnTeamId < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :home_team, foreign_key: { to_table: :teams}
    add_reference :schedules, :away_team, foreign_key: { to_table: :teams}
  end
end
