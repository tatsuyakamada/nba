class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :conference, null: false     #カンファレンス
      t.string :division, null: false       #ディビジョン
      t.string :team_name, null: false      #チーム名
      t.date :establishment, null: false    #設立
      t.string :home_court, null: false     #本拠地
      t.string :owner, null: false          #オーナー

      t.timestamps
    end
  end
end
