class AddReferenceModelToNmsConfig < ActiveRecord::Migration
  def change
    add_column :nms_configs, :reference_model, :string
  end
end
