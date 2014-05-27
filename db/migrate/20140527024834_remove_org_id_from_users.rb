class RemoveOrgIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :org_id, :integer
  end
end
