class ChangeColumnTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :home_team
    remove_column :schedules, :away_team
  end
end
