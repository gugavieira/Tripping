class DropPosts < ActiveRecord::Migration
  def self.up
    drop_table :posts
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
