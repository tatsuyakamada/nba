class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :schedules, :home_team_score, :home_score
    rename_column :schedules, :away_team_score, :away_score
  end
end
