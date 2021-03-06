class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :image;
      t.boolean :member_only, default: false, null: false
      
      t.timestamps
    end
  end
end
