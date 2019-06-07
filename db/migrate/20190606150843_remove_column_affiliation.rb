class RemoveColumnAffiliation < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :affiliation, :integer
  end
end
