class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false                             #タイトル
      t.string :body, null: false                              #本文
      t.string :image                                          #画像
      t.boolean :member_only, default: false, null: false      #会員限定
      
      t.timestamps
    end
  end
end
