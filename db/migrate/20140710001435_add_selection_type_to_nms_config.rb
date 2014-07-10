class AddSelectionTypeToNmsConfig < ActiveRecord::Migration
  def change
    add_column :nms_configs, :selection_type, :string
  end
end
