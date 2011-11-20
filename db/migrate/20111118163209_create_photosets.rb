class CreatePhotosets < ActiveRecord::Migration
  def change
    create_table :photosets do |t|
      t.string :name
      t.integer :flickr_set_id
      t.string :thumbnail

      t.timestamps
    end
  end
end
