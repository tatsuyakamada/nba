class ChanegColumnAffiliation < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :affiliation, :integer
  end
end
