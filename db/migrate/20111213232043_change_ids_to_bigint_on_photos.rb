class ChangeIdsToBigintOnPhotos < ActiveRecord::Migration
  def up
    change_column :photos, :photoset_id, :bigint
    change_column :photos, :flickr_photo_id, :bigint
    change_column :photosets, :flickr_set_id, :bigint
  end

  def down
  end
end
