class AddHcImageToHc < ActiveRecord::Migration[5.2]
  def change
    add_column :headcoaches, :headcoach_image, :string
  end
end
