class RemoveOrgIdFromMemberships < ActiveRecord::Migration
  def change
    remove_column :positions, :org_id, :integer
    remove_column :memberships, :org_id, :integer

    add_column :positions, :organization_id, :integer
    add_column :memberships, :organization_id, :integer
  end
end
