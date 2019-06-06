class ChangeColumnPosition < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :positions, :string
    add_column :players, :positions, :integer
  end
end
