class RemovePosition < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :position, :string
  end
end
