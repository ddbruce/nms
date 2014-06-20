class AddDetailsToNmsConfig < ActiveRecord::Migration
  def change
    add_column :nms_configs, :key, :string
    add_column :nms_configs, :value, :string
  end
end
