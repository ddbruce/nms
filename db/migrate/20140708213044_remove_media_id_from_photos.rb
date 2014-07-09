class RemoveMediaIdFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :media_id, :integer
  end
end
