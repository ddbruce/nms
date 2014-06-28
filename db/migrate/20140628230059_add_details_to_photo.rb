class AddDetailsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :media_id, :integer
  end
end
