class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :conference, null: false
      t.string :division, null: false
      t.string :team_name, null: false
      t.date :establishment, null: false
      t.string :home_court, null: false
      t.string :owner, null: false

      t.timestamps
    end
  end
end
