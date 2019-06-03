class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :number, null:false
      t.string :position, null:false
      t.datetime :birthday, null:false
      t.float :height, null:false
      t.float :weight, null:false
      t.string :college, null:false

      t.timestamps
    end
  end
end
