class AddCommentMemberIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :member_id, :integer
    add_column :comments, :post_id, :bigint
  end
end
