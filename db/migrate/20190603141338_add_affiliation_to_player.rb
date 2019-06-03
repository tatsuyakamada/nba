class AddAffiliationToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :affiliation, :string
  end
end
