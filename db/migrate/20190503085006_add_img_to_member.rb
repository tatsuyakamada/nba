class AddImgToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :profile_image, :string
  end
end
