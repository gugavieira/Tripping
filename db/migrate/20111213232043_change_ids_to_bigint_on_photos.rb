class ChangeIdsToBigintOnPhotos < ActiveRecord::Migration
  def up
	change_table :photos do |t|
		t.bigint :photoset_id, :flickr_photo_id
	end
	change_table :photosets do |t|
		t.bigint :flickr_set_id
	end
end

  end

  def down
  end
end
