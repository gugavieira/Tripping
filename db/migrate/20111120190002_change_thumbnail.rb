class ChangeThumbnail < ActiveRecord::Migration
  def change
	  change_table :photosets do |t|
		  t.rename :thumbnail, :thumb_id_flickr
  	   end
  end
  def down
  end
end
