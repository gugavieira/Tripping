class AddPositionToPhotosets < ActiveRecord::Migration
  def change
    add_column :photosets, :position, :integer
  end
end
