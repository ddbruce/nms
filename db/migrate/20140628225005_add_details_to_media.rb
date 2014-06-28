class AddDetailsToMedia < ActiveRecord::Migration
  def change
    add_column :media, :media_type, :integer
    add_column :media, :media_id, :integer
  end
end
