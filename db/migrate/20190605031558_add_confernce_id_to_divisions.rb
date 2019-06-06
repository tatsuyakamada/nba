class AddConfernceIdToDivisions < ActiveRecord::Migration[5.2]
  def change
    add_column :divisions, :conference_id, :integer
  end
end
