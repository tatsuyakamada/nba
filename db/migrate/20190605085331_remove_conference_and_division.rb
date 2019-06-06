class RemoveConferenceAndDivision < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :conference, :string
    remove_column :teams, :division, :string
    add_column :teams, :division_id, :integer
  end
end
