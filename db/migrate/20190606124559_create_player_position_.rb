class CreatePlayerPosition < ActiveRecord::Migration[5.2]
  def change
    create_table :players_positions, id: false do |t|
      t.references :player, index: true, null: false
      t.references :position, index: true, null: false
    end
  end
end
