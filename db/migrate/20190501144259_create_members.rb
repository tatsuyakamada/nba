class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_call, null: false
      t.string :first_name_call, null: false
      t.string :email, null: false
      t.datetime :birthday, null: false
      t.integer :sex, null: false, default: 0;
      t.boolean :administrator, null: false, default: false;
      
      t.timestamps
    end
  end
end
