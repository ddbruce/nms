class AddIsActiveToSections < ActiveRecord::Migration
  def change
    add_column :sections, :is_active, :boolean, null: false, default: false
  end
end
