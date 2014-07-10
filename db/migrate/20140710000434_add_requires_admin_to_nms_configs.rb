class AddRequiresAdminToNmsConfigs < ActiveRecord::Migration
  def change
    add_column :nms_configs, :requires_admin, :boolean, null: false, default: true
  end
end
