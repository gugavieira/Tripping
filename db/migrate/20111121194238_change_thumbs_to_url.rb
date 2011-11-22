class ChangeThumbsToUrl < ActiveRecord::Migration
  def up
	  change_table :photosets do |t|
		  t.remove :flickr_thumb_id
		  t.string :flickr_thumb_url
		  t.index :flickr_set_id, :unique => true
  	   end
  end

  def down
  end
end
