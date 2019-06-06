class CreateHeadcoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :headcoaches do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.datetime :birthday, null:false
      t.string :college, null:false 

      t.timestamps
    end
  end
end
