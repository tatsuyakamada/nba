class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :last_name, null:false                       #苗字
      t.string :first_name, null:false                      #名前
      t.string :last_name_call, null:false                  #苗字(ふりがな)
      t.string :first_name_call, null:false                 #名前(ふりがな)
      t.string :email, null:false                           #メールアドレス
      t.datetime :birthday, null:false                      #誕生日
      t.integer :sex, null:false, default: 0                #性別(男性:0,女性:1)
      t.boolean :administrator, null:false, default: false  #管理者

      t.timestamps
    end
  end
end
