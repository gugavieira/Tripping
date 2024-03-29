class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photoset_id
      t.string :url
      t.boolean :private, :default => false

      t.timestamps
    end
  end
end
