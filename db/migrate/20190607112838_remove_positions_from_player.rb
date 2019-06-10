class RemovePositionsFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :positions, :string
  end
end
