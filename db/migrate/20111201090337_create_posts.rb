class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :photoset_id
      t.string :image_url
      t.string :content

      t.timestamps
    end
  end
end
