class AddImageToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :image, :string
  end
end
