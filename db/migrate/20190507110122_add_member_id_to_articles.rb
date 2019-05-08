class AddMemberIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :member_id, :integer
  end
end
