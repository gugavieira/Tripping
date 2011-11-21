class ChangeThumbnailsToInteger < ActiveRecord::Migration
  def change
	  change_table :photosets do |t|
		  t.remove :thumb_id_flickr
		  t.integer :flickr_thumb_id
		  t.index :flickr_thumb_id
  	   end
  end

  def down
  end
end
