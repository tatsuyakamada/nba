class RenameMenbertoMember < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :menber_only, :member_only
  end
end
