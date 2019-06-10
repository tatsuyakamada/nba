class CreateTeamPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_players do |t|
      t.date :contract_start, null:false
      t.date :contract_period, null:false

      t.timestamps
    end
  end
end
