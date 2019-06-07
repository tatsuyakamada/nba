class ChangeColumimage < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :image, :player_image
    rename_column :teams, :image, :team_image
  end
end
