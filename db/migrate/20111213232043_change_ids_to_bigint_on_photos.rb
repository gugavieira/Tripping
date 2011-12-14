class ChangeIdsToBigintOnPhotos < ActiveRecord::Migration
  def up
	change_table :photos do |t|
		t.remove :photoset_id, :flickr_photo_id
		t.integer :photoset_id, :limit => 8
		t.integer :flickr_photo_id, :limit => 8
	end
	change_table :photosets do |t|
		t.remove :flickr_set_id
		t.integer :flickr_set_id, :limit => 8
	end
  end

  def down
  end
end
