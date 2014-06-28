class AddUserandOrganizationDetailsToMedia < ActiveRecord::Migration
  def change
    add_column :media, :user_id, :integer
    add_column :media, :organization_id, :integer
  end
end
