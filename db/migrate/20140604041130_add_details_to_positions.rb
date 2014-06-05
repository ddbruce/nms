class AddDetailsToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :title, :string
    add_column :positions, :org_id, :integer
  end
end
