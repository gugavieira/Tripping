class AddThumburlHeightWidthToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :thumb_url, :string
    add_column :photos, :height, :integer
    add_column :photos, :width, :integer
  end
end
