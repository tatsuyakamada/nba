class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.string :conference_name, null: false

      t.timestamps
    end
  end
end
