class AddReferenceTeamPlayer < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_players, :player, foreign_key: true
  end
end
