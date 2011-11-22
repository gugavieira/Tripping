class ChangePhotosetIdToString < ActiveRecord::Migration
  def up
  	change_table :photosets do |t|
		  t.change :flickr_set_id, :string
  	   end
  end

  def down
  end
end
